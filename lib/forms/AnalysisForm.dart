import 'package:blueearth/forms/AnalysisForm2.dart';
import 'package:flutter/material.dart';

class AnalysysForm extends StatefulWidget {
  const AnalysysForm({Key? key}) : super(key: key);

  @override
  _AnalysysFormState createState() => _AnalysysFormState();
}

class _AnalysysFormState extends State<AnalysysForm> {
  int countTrue = 0;
  int countFalse = 0;
  TextEditingController _espessuraController = TextEditingController();

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
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      controller: _espessuraController,
                      decoration: new InputDecoration(
                        hintText: 'Espessura',
                      ),
                      maxLength: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "É possível visualizar essa estrutura de atividade biológica nessa camada de solo?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Image.asset(
                  'images/agregado1e4.png',
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
                                builder: (context) => AnalysisForm2(
                                  countFalse: countFalse,
                                  countTrue: countTrue,
                                  espessuraController: _espessuraController,
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
                                builder: (context) => AnalysisForm2(
                                  countFalse: countFalse,
                                  countTrue: countTrue,
                                  espessuraController: _espessuraController,
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
