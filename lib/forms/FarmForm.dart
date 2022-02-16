import 'package:blueearth/widgets/FarmFormWidget.dart';
import 'package:flutter/material.dart';

class FarmForm extends StatefulWidget {
  const FarmForm({Key? key}) : super(key: key);

  @override
  _FarmFormState createState() => _FarmFormState();
}

class _FarmFormState extends State<FarmForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blue Earth"),
        centerTitle: true,
        backgroundColor: Colors.blue[75],
        toolbarHeight: 50,
      ),
      body: Container(
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
                          "Fazenda",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FarmFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
