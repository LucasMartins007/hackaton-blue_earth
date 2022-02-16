import 'package:blueearth/pages/ResultPage.dart';
import 'package:blueearth/services/IQEAService.dart';
import 'package:flutter/material.dart';

class AnalysisForm13 extends StatefulWidget {
  final int countTrue;
  final int countFalse;
  final TextEditingController espessuraController;

  const AnalysisForm13({
    Key? key,
    required this.countFalse,
    required this.countTrue,
    required this.espessuraController,
  }) : super(key: key);

  @override
  _AnalysisForm13State createState() => _AnalysisForm13State();
}

class _AnalysisForm13State extends State<AnalysisForm13> {
  @override
  Widget build(BuildContext context) {
    int countFalse = widget.countFalse;
    int countTrue = widget.countTrue;
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
                          "Relatório de análises",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Apresenta presença de areia iluviada sobre as súperficies de roptura do agregado. Escala em centimetros(cm)?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Image.asset(
                  'images/pedra13.jpeg',
                  height: 450,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
