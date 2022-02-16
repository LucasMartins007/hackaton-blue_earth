import 'dart:async';
import 'dart:io';

import 'package:blueearth/model/Talhao.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';

class DBProviderTalhao {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "blueearth.db");

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE secao(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            area_sessao TEXT,
            id_farm TEXT
            )
           """);
    });
  }

  Future<int> addTalhao(Talhao talhao) async {
    final db = await init();

    return db.insert(
      "secao",
      talhao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Talhao>> fetchTalhao() async {
    final db = await init();
    final maps = await db.query("secao");

    return List.generate(maps.length, (i) {
      return Talhao(
        id: maps[i]['id'],
        name: maps[i]['name'],
        areaSessao: maps[i]['area_sessao'],
        id_farm: maps[i]['id_farm'],
      );
    });
  }

  Future<int> updateTalhao(int id, Talhao talhao) async {
    final db = await init();

    int result = await db
        .update("secao", talhao.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<Talhao> findById(int talhaoId) async {
    final db = await init();
    final map = await db.query("secao", where: "id = ?", whereArgs: [talhaoId]);
    return Talhao.fromMap(map.first);
  }
}
