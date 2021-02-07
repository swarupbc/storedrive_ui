import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storedrive_ui/model/userModel.dart';
import 'package:storedrive_ui/views/Home/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  headerSection(),
                  textSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text(
        'StoreDrive',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      margin: EdgeInsets.only(
        top: 30.0,
      ),
      child: Column(children: [
        textEmail('Email', Icons.email),
        SizedBox(
          height: 30.0,
        ),
        textPassword('Password', Icons.lock),
      ]),
    );
  }

  final TextEditingController emailController = TextEditingController();

  TextField textEmail(String title, IconData icon) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: title,
        icon: Icon(icon),
      ),
    );
  }

  final TextEditingController passwordController = TextEditingController();

  TextField textPassword(String title, IconData icon) {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: title,
        icon: Icon(icon),
      ),
    );
  }

  Future<UserModel> login(String email, password) async {
    var userModel;
    Map data = {
      "login_id": email,
      "login_pwd": password,
    };

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
        'https://api.samriddhisolutions.in/vconnect/rds/login.php',
        body: data);
    try {
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var jsonMap = json.decode(jsonData);
        userModel = UserModel.fromJson(jsonMap);
        setState(
          () {
            _isLoading = false;
            print('Logged In');
            sharedPreferences.setString('user_id', userModel.userId);
            print(userModel.userId);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()),
                (Route<dynamic> route) => false);
          },
        );
      } else {
        print(response.body);
      }
    } catch (c) {
      print(c);
    }
    return userModel;
  }

  GestureDetector buttonSection() {
    return GestureDetector(
      onTap: () {
        login(emailController.text, passwordController.text);
        setState(() {
          _isLoading = true;
        });
      },
      child: Container(
        height: 45.0,
        width: 200.0,
        decoration: BoxDecoration(color: Colors.purple),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
