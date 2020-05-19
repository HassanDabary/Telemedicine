import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'package:http/http.dart' as http;

final color = const Color(0xFF0c3b6c);

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  // For CircularProgressIndicator.
  bool visible = false;

  Future userLogin() async {}
  TextEditingController usernameTxController = TextEditingController();
  TextEditingController passwordTxController = TextEditingController();

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: color,
          ),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: color),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Container(
              child: Center(
                child: Text(
                  'Login to get help from doctors',
                  style: TextStyle(
                      color: color, fontFamily: 'Raleway', fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 90,
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: usernameTxController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Usser Name',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(15.7),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 90,
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: passwordTxController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(15.7),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 90,
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(
                        top: 15, bottom: 15, left: 30, right: 30),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: color,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          userLogin();
                        },
                        child: Center(
                          child: Text(
                            ' Login ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 110,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'New User?  ',
                          style: TextStyle(
                              color: color,
                              fontFamily: 'Raleway',
                              fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: _goSignup,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: color,
                                fontFamily: 'Raleway',
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _subscribe() {
    //Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }
  void _goSignup() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new SignUp()));
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => new _SignUp();
}

class _SignUp extends State<SignUp> {
  bool visible = false;

  Future signup() async {}
  TextEditingController usernameTxController = TextEditingController();
  TextEditingController passwordTxController = TextEditingController();
  TextEditingController nameTxController = TextEditingController();

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: color,
          ),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: color),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Container(
              child: Center(
                child: Text(
                  'Sign Up to get help from doctors',
                  style: TextStyle(
                      color: color, fontFamily: 'Raleway', fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 90,
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: nameTxController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(15.7),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 90,
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: usernameTxController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(15.7),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 90,
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: passwordTxController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(15.7),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 90,
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(
                        top: 15, bottom: 15, left: 30, right: 30),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: color,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          signup();
                        },
                        child: Center(
                          child: Text(
                            ' Sign Up ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Already have account?  ',
                          style: TextStyle(
                              color: color,
                              fontFamily: 'Raleway',
                              fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: _goLogin,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: color,
                                fontFamily: 'Raleway',
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _subscribe() {
    //Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }
  void _goLogin() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Login()));
  }
}
