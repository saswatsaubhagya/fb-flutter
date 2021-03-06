import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './preferences.dart';
import '../models/user.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _formkey = new GlobalKey<FormState>();
  User user = new User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(45, 72, 156, 1),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.6,
                  child: ClipPath(
                    clipper: ClippingClass(),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Image.asset("assets/logobuddy.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.white)),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Name id Requaird';
                            }
                          },
                          onSaved: (String value) {
                            user.name = value.trim();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: "Email Id",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Email id Requaird';
                            }
                          },
                          onSaved: (String value) {
                            user.email = value.trim();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        TextFormField(
                          obscureText: true,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Password id Requaird';
                            }
                          },
                          onSaved: (String value) {
                            user.password = value.trim();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        // TextFormField(
                        //   obscureText: true,
                        //   cursorColor: Colors.white,
                        //   style: TextStyle(color: Colors.white),
                        //   decoration: InputDecoration(
                        //     enabledBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.white)),
                        //     hintText: "Confirm Password",
                        //     hintStyle: TextStyle(color: Colors.white),
                        //   ),
                        //   validator: (String value) {
                        //     if (value.isEmpty) {
                        //       return 'Confirm Password id Requaird';
                        //     } else if (user.password != value.trim()) {
                        //       return 'Confirm Password donot match ';
                        //     }
                        //   },
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 25.0),
                        // ),
                        RaisedButton(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Color.fromRGBO(127, 168, 235, 1),
                          onPressed: () {
                            if (!_formkey.currentState.validate()) {
                              return;
                            }
                            _formkey.currentState.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PreferencePage(
                                          userdata: user,
                                        )));
                          },
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
