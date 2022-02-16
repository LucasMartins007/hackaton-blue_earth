import 'package:blueearth/forms/AnalysisForm.dart';
import 'package:blueearth/forms/TalhaoForm.dart';
import 'package:blueearth/model/Analysis.dart';
import 'package:blueearth/model/Farm.dart';
import 'package:blueearth/model/Talhao.dart';
import 'package:blueearth/pages/ResultPage.dart';
import 'package:blueearth/repository/DBProviderTalhao.dart';
import 'package:blueearth/repository/DbProvider.dart';
import 'package:blueearth/widgets/TalhaoFormWidget.dart';
import 'package:flutter/material.dart';

class ListTalhaoWidget extends StatefulWidget {
  final int idFarm;
  const ListTalhaoWidget({Key? key, required this.idFarm}) : super(key: key);

  @override
  _ListTalhaoWidgetState createState() => _ListTalhaoWidgetState();
}

class _ListTalhaoWidgetState extends State<ListTalhaoWidget> {
  ScrollController _idTalhao = new ScrollController();

  Future<List<Talhao>> getTalhoes() async {
    return await DBProviderTalhao().fetchTalhao();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
    //     children: [
    //       Container(
    //         width: MediaQuery.of(context).size.width / 3,
    //         child: Text(
    //           "Talhão 1",
    //           style: TextStyle(
    //             fontSize: 20.0,
    //             color: Colors.black,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         width: MediaQuery.of(context).size.width / 3,
    //         child: Column(
    //           children: [
    //             Text(
    //               "20 HE",
    //               style: TextStyle(
    //                 fontSize: 20.0,
    //                 color: Colors.black,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         width: MediaQuery.of(context).size.width / 4,
    //         child: IconButton(
    //           onPressed: () {
    //             Navigator.pop(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => AnalysysForm(),
    //               ),
    //             );
    //           },
    //           icon: Icon(Icons.access_alarm_outlined),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
