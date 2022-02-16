import 'package:blueearth/forms/FarmForm.dart';
import 'package:blueearth/model/Farm.dart';
import 'package:blueearth/repository/DbProvider.dart';
import 'package:blueearth/widgets/ListFarmsWidget.dart';
import 'package:flutter/material.dart';

class Farms extends StatefulWidget {
  const Farms({Key? key}) : super(key: key);

  @override
  _FarmsState createState() => _FarmsState();
}

class _FarmsState extends State<Farms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blue Earth"),
        centerTitle: true,
        backgroundColor: Colors.blue[75],
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Fazendas cadastradas",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FarmListWidget(),
          ),
          Container(
            color: Colors.blue[75],
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              child: Text("Adicionar Fazenda"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FarmForm(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
