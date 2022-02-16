import 'package:blueearth/forms/AnalysisForm8.dart';
import 'package:blueearth/pages/ResultPage.dart';
import 'package:blueearth/services/IQEAService.dart';
import 'package:flutter/material.dart';

class AnalysisForm7 extends StatefulWidget {
  final int countTrue;
  final int countFalse;
  final TextEditingController espessuraController;

  const AnalysisForm7({
    Key? key,
    required this.countFalse,
    required this.countTrue,
    required this.espessuraController,
  }) : super(key: key);

  @override
  _AnalysisForm7State createState() => _AnalysisForm7State();
}

class _AnalysisForm7State extends State<AnalysisForm7> {
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
                    "Apresenta presença de minhocas ou fungos micorrízicos em agregados ou coprólitos?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Image.asset(
                  'images/raiz7.jpeg',
                  height: 450,
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
                                builder: (context) => AnalysisForm8(
                                  countFalse: countFalse,
                                  countTrue: countTrue,
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
                                builder: (context) => AnalysisForm8(
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
