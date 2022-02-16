import 'dart:ui';

import 'package:blueearth/widgets/LoginFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = new GlobalKey();

    return Container(
      child: new SingleChildScrollView(
        child: new Container(
          width: MediaQuery.of(context).size.width,
          margin: new EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Faça seu Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Form(
                key: _key,
                child: LoginFormWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
