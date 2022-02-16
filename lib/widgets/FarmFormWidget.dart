import 'package:blueearth/model/Farm.dart';
import 'package:blueearth/pages/FarmPage.dart';
import 'package:blueearth/repository/DbProvider.dart';
import 'package:flutter/material.dart';

class FarmFormWidget extends StatelessWidget {
  const FarmFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _cityController = TextEditingController();
    TextEditingController _stateController = TextEditingController();
    TextEditingController _latitudeController = TextEditingController();
    TextEditingController _longitudeController = TextEditingController();

    return new Column(
      children: <Widget>[
        new TextFormField(
          controller: _nameController,
          decoration: new InputDecoration(
            hintText: 'Nome',
          ),
          maxLength: 40,
        ),
        new TextFormField(
          controller: _cityController,
          decoration: new InputDecoration(
            hintText: 'Cidade',
          ),
          maxLength: 40,
        ),
        new TextFormField(
          controller: _stateController,
          decoration: new InputDecoration(
            hintText: 'Estado',
          ),
          maxLength: 40,
        ),
        new TextFormField(
          controller: _latitudeController,
          decoration: new InputDecoration(
            hintText: 'Latitude',
          ),
          maxLength: 40,
        ),
        new TextFormField(
          controller: _longitudeController,
          decoration: new InputDecoration(
            hintText: 'Longitude',
          ),
          maxLength: 40,
        ),
        new ElevatedButton(
          child: Text("Cadastrar Fazenda."),
          onPressed: () {
            Farm farm = new Farm(
              id: 2,
              name: _nameController.text,
              state: _stateController.text,
              city: _cityController.text,
              latitude: _latitudeController.text,
              longitude: _longitudeController.text,
            );
            DbProvider().addfarm(farm);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Farms(),
                ));
          },
        ),
      ],
    );
  }
}
