import 'package:flutter/material.dart';

class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TextformFieldWidgetState createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordVisible,
      decoration: new InputDecoration(
        hintText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
      keyboardType: TextInputType.phone,
      maxLength: 10,
    );
  }
}
