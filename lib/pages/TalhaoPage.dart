import 'package:blueearth/forms/AnalysisForm.dart';
import 'package:blueearth/forms/TalhaoForm.dart';
import 'package:blueearth/model/Farm.dart';
import 'package:blueearth/model/Talhao.dart';
import 'package:blueearth/repository/DBProviderTalhao.dart';
import 'package:blueearth/repository/DbProvider.dart';
import 'package:blueearth/widgets/ListTalhaoWidget.dart';
import 'package:flutter/material.dart';

class TalhaoPage extends StatefulWidget {
  final int idFarm;
  const TalhaoPage({Key? key, required this.idFarm}) : super(key: key);

  @override
  _TalhaoPageState createState() => _TalhaoPageState();
}

class _TalhaoPageState extends State<TalhaoPage> {
  teste() {
    DBProviderTalhao().fetchTalhao();
  }

  teste2() {
    DbProvider().fetchFarms();
  }

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
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Talhão da análise",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnalysysForm(),
                        ));
                  },
                  title: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          "Talhão 1",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          children: [
                            Text(
                              "20 HE",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.blue[75],
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          child: Text("Adicionar Talhão"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TalhaoForm(idFarm: widget.idFarm),
              ),
            );
          },
        ),
      ),
    );
  }
}
