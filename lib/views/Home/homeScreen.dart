import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storedrive_ui/views/login/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('status') == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                sharedPreferences.clear();
              },
              child: Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
