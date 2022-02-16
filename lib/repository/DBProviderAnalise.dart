import 'dart:async';
import 'dart:io';

import 'package:blueearth/model/Analysis.dart';
import 'package:blueearth/model/Farm.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';

class DBProviderAnalise {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "blueearth.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE analysis(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            espessura REAL,
            nota_agregada REAL,
            media_ponderada REAL,
            observacao TEXT,
          )""");
    });
  }

  Future<int> addAnalisys(Analyis analisys) async {
    final db = await init();

    return db.insert(
      "analysis",
      analisys.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Analyis>> fetchAnalyis() async {
    final db = await init();
    final maps = await db.query("analisys");

    return List.generate(maps.length, (i) {
      return Analyis(
        espessura: maps[i]['espessura'],
        nota_agregada: maps[i]['nota_agregada'],
        media_ponderada: maps[i]['media_ponderada'],
        observacao: maps[i]['observacao'],
      );
    });
  }

  Future<int> updateFarm(int id, Analyis analyis) async {
    final db = await init();

    int result = await db
        .update("analisys", analyis.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
