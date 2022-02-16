import 'package:blueearth/pages/ResultPage.dart';
import 'package:blueearth/services/IQEAService.dart';
import 'package:flutter/material.dart';

class AnalysisResult extends StatefulWidget {
  final String resultado;
  final String expessura;
  const AnalysisResult(
      {Key? key, required this.resultado, required this.expessura})
      : super(key: key);

  @override
  _AnalysisResultState createState() => _AnalysisResultState();
}

class _AnalysisResultState extends State<AnalysisResult> {
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
                          "Porcentagem do solo",
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
                    "Selecione a imagem que representa melhor a porcentagem encontrada nas amostras entre 1 e 4cm.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          double resultado =
                              IQEAService().calcularNota(widget.expessura, 4);
                          print(widget.expessura);
                          print(resultado.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                resultado: resultado,
                                nota: "Q4",
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'images/q4.jpg',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          double resultado =
                              IQEAService().calcularNota(widget.expessura, 5);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                resultado: resultado,
                                nota: "Q5",
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'images/q5.jpg',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          double resultado =
                              IQEAService().calcularNota(widget.expessura, 6);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                resultado: resultado,
                                nota: "Q6",
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'images/q6.jpg',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
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
