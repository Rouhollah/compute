import 'dart:convert';

import 'package:compute/LoginModel.dart';
import 'package:compute/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "ورود",
              style: TextStyle(color: Colors.black45, fontFamily: "IranSans"),
            ),
            centerTitle: true,
            backgroundColor: Colors.blueGrey),
        body: loginUi());
  }

  Widget loginUi() {
    return Builder(
        builder: (context) => Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        elevation: 20,
                        shadowColor: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(20),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'نام کاربری',
                              icon: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(Icons.person_outline),
                              )),
                          controller: userController,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Material(
                        elevation: 20,
                        shadowColor: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(20),
                        child: TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'رمز عبور',
                              icon: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(Icons.lock_outline),
                              )),
                          controller: passwordController,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: MaterialButton(
                                color: Colors.blue,
                                //minWidth: MediaQuery.of(context).size.width / 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  // side: BorderSide(
                                  //   color: Colors.green[50],
                                  //   width: 2.0,
                                  // ),
                                ),
                                onPressed: () {
                                  login(
                                      context: context,
                                      username: userController.text,
                                      password: passwordController.text);
                                },
                                height: 50,
                                //color: Colors.blue,
                                //elevation: 15,
                                //focusColor: Colors.blue[800],
                                child: Text(
                                  'ورود',
                                  style: TextStyle(
                                      fontFamily: 'IranSans',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: MaterialButton(
                                color: Colors.blue,
                                //minWidth: MediaQuery.of(context).size.width / 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  // side: BorderSide(
                                  //   color: Colors.green[50],
                                  //   width: 2.0,
                                  // ),
                                ),
                                onPressed: () {},
                                height: 50,
                                //color: Colors.blue,
                                //elevation: 15,
                                //focusColor: Colors.blue[800],
                                child: Text(
                                  'ثبت نام',
                                  style: TextStyle(
                                      fontFamily: 'IranSans',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]));
  }

  login(
      {@required BuildContext context,
      @required String username,
      @required String password}) async {
    String url = 'http://welearnacademy.ir/flutter/api/?type=login';
    var body = Map<String, dynamic>();
    body['username'] = username;
    body['password'] = password;

    Response response = await post(url, body: body);
    if (response.statusCode == 200) {
      var jsonresult = json.decode(utf8.decode(response.bodyBytes));
      var result =
          LoginResponseModel(jsonresult['result'], jsonresult['message']);
      Color resultColor = Colors.amber;
      if (result.result != 1) {
        resultColor = Colors.red;
      } else {
        resultColor = Colors.green;
      }
      showSnakBar(context, result.message, resultColor);
      // برای اینکه از صفحه لاگین به صفحه قبل بر نگردد  به جای
      // push
      // pushReplacement
      // استفاده می کنیم
      Navigator.of(context).pushReplacement(_goToHome());
      // .push(MaterialPageRoute(builder: (context) => Stor()));
    } else {
      showSnakBar(context, 'درخواست با خطا مواجه شد', Colors.red);
    }
  }

  showSnakBar(BuildContext context, String message, Color color) {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'IranSans', fontSize: 15, color: Colors.white),
        )));
  }

  Route _goToHome() {
    var begin = 0.0; //Offset(0.0, 1.0);
    var end = 1.0; //Offset.zero;
    var curve = Curves.fastOutSlowIn;
    var tween =
        Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
    //var tween2=Tween<double>(begin: 0,end: 1).chain(CurveTween(curve:curve));
    return PageRouteBuilder(
        transitionDuration: Duration(microseconds: 500),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation) {
          return Stor();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation, Widget widget) {
          return ScaleTransition(
            child: widget,
            // position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
            //     .animate(animation)
            scale: animation.drive(tween),
          );
        });
  }
}
