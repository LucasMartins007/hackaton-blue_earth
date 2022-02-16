import 'package:blueearth/model/Talhao.dart';
import 'package:blueearth/repository/DBProviderTalhao.dart';
import 'package:blueearth/widgets/ListTalhaoWidget.dart';
import 'package:flutter/material.dart';

class TalhaoFormWidget extends StatelessWidget {
  final int idFarm;
  const TalhaoFormWidget({Key? key, required this.idFarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _areaController = TextEditingController();

    return new Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              new TextFormField(
                controller: _nameController,
                decoration: new InputDecoration(
                  hintText: 'Nome da área da coleta',
                ),
                maxLength: 40,
              ),
              new TextFormField(
                controller: _areaController,
                decoration: new InputDecoration(
                  hintText: 'Tamanho da área em Hectare',
                ),
                maxLength: 40,
              ),
              new ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  Talhao talhao = new Talhao(
                    id: 0,
                    name: _nameController.text,
                    areaSessao: double.parse(_areaController.text.toString()),
                    id_farm: this.idFarm,
                  );

                  DBProviderTalhao().addTalhao(talhao);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListTalhaoWidget(
                        idFarm: this.idFarm,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
