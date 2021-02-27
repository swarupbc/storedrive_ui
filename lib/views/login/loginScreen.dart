import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storedrive_ui/model/LoginModel.dart';
import 'package:storedrive_ui/model/userModel.dart';
import 'package:storedrive_ui/views/Home/homeScreen.dart';
import 'package:storedrive_ui/views/login/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRequestModel requestModel;

  @override
  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
  }

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

  final TextEditingController phoneController = TextEditingController();

  TextField textEmail(String title, IconData icon) {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.number,
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

  GestureDetector buttonSection() {
    return GestureDetector(
      onTap: () {
        requestModel.phone = phoneController.text;
        requestModel.password = passwordController.text;

        // setState(() {
        // _isLoading = true;
        // });
        print(requestModel.toJson());
        APIService apiService = APIService();
        apiService.login(requestModel).then((value) => {
              if (value.username.isEmpty)
                {
                  print('Login Success'),
                }
              else
                {
                  print('Login Failed'),
                }
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

  // Future login({String phone, password}) async {
  //   Map data = {
  //     "login_id": phone,
  //     "login_pwd": password,
  //   };

  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var response = await http.post(
  //       'https://api.samriddhisolutions.in/vconnect/rds/login.php',
  //       body: data);
  //   var jsonResponse;
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     var userModel = UserModel.fromJson(jsonResponse);
  //     String userNumber = userModel.contactNo.toString();

  //     await sharedPreferences.setString('number', userNumber);

  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
  //         (Route<dynamic> route) => false);

  //     if (userModel != null) {
  //       setState(() {
  //         print(userModel);
  //         print('Logged In');
  //         _isLoading = false;
  //       });
  //     } else {
  //       print(response.body);
  //     }
  //     return userModel;
  //   }
  // }
}
