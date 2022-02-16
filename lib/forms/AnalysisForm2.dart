import 'package:blueearth/forms/AnalysisForm.dart';
import 'package:blueearth/forms/AnalysisForm3.dart';
import 'package:flutter/material.dart';

class AnalysisForm2 extends StatefulWidget {
  final int countTrue;
  final int countFalse;
  final TextEditingController espessuraController;

  const AnalysisForm2(
      {Key? key,
      required this.countTrue,
      required this.countFalse,
      required this.espessuraController})
      : super(key: key);

  @override
  _AnalysisForm2State createState() => _AnalysisForm2State();
}

class _AnalysisForm2State extends State<AnalysisForm2> {
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
                    "Apresenta raizes pivontes sem deformações que comprometam o crescimento vertical?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Image.asset(
                  'images/raizes2.jpeg',
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            countTrue += 1;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnalysisForm3(
                                  countTrue: countTrue,
                                  countFalse: countFalse,
                                  espessuraController:
                                      widget.espessuraController,
                                ),
                              ),
                            );
                          },
                          child: Text("Sim"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            countFalse += 1;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnalysisForm3(
                                  countFalse: countFalse,
                                  countTrue: countTrue,
                                  espessuraController:
                                      widget.espessuraController,
                                ),
                              ),
                            );
                          },
                          child: Text("Não"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
