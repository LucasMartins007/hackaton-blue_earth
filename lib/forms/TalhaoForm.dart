import 'package:blueearth/widgets/FarmFormWidget.dart';
import 'package:blueearth/widgets/TalhaoFormWidget.dart';
import 'package:flutter/material.dart';

class TalhaoForm extends StatefulWidget {
  final int idFarm;
  const TalhaoForm({Key? key, required this.idFarm}) : super(key: key);

  @override
  _TalhaoFormState createState() => _TalhaoFormState();
}

class _TalhaoFormState extends State<TalhaoForm> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = new GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text("Blue Earth"),
        centerTitle: true,
        backgroundColor: Colors.blue[75],
        toolbarHeight: 50,
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: Container(
            child: new SingleChildScrollView(
              child: new Container(
                width: MediaQuery.of(context).size.width,
                margin: new EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              "Cadastro de talhões",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TalhaoFormWidget(
                      idFarm: widget.idFarm,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
