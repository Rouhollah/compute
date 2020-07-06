import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "ورود",
            style: TextStyle(color: Colors.black45, fontFamily: "IranSans"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: Center(
        child: Column(
          children: <Widget>[
            Material(
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'user name'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
