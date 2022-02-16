import 'package:blueearth/forms/FarmForm.dart';
import 'package:blueearth/pages/FarmPage.dart';
import 'package:blueearth/repository/DbProvider.dart';
import 'package:flutter/material.dart';
import 'TextFormFieldWidget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(
            hintText: 'Login',
          ),
          maxLength: 40,
        ),
        new TextformFieldWidget(),
        new ElevatedButton(
            child: Text("Entrar"),
            onPressed: () {
              var farms = DbProvider().fetchFarms();

              if (farms == null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmForm(),
                    ));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Farms(),
                    ));
              }
            }),
      ],
    );
  }
}
