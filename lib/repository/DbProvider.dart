import 'dart:async';
import 'dart:io';

import 'package:blueearth/model/Farm.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "blueearth.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE farm(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            state TEXT,
            city TEXT,
            latitude TEXT,
            longitude TEXT
          )
          """);
    });
  }

  Future<int> addfarm(Farm farm) async {
    final db = await init();

    return db.insert(
      "farm",
      farm.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Farm>> fetchFarms() async {
    final db = await init();
    final maps = await db.query("farm");

    return List.generate(maps.length, (i) {
      return Farm(
        id: maps[i]['id'],
        name: maps[i]['name'],
        state: maps[i]['state'],
        city: maps[i]['city'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

  Future<int> updateFarm(int id, Farm farm) async {
    final db = await init();

    int result =
        await db.update("farm", farm.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<Farm> findById(int farmId) async {
    final db = await init();
    final map = await db.query("farm", where: "id = ?", whereArgs: [farmId]);
    return Farm.fromMap(map.first);
  }
}
