import 'package:blueearth/model/Farm.dart';
import 'package:blueearth/pages/TalhaoPage.dart';
import 'package:blueearth/repository/DbProvider.dart';
import 'package:flutter/material.dart';

class FarmListWidget extends StatelessWidget {
  ScrollController _idFarm = new ScrollController();

  Future<List<Farm>> _getFarms() async {
    return await DbProvider().fetchFarms();
  }

  @override
  Widget build(context) {
    return FutureBuilder<List<Farm>>(
      future: _getFarms(),
      builder: (context, AsyncSnapshot<List<Farm>> snapshot) {
        if (snapshot.hasData) {
          List<Farm>? farms = snapshot.data;

          return ListView.builder(
            controller: _idFarm,
            itemCount: farms!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TalhaoPage(idFarm: farms[index].id),
                    ),
                  );
                },
                title: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        farms[index].name.toString(),
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
                            farms[index].city.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(farms[index].state),
                contentPadding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
