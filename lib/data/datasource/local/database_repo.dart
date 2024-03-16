import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/data/models/surah_bookmark.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal(){
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initDb();
    return _database;
  }

  static const String _tableName = 'surah';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/surah.db';
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_tableName (
          id INTEGER PRIMARY KEY,
          nomor INTEGER,
          nama TEXT,
          nama_latin TEXT,
          tempat_turun TEXT,
          jumlah_ayat INTEGER,
          arti TEXT,
          deskripsi TEXT,
          audio TEXT
        )
      ''');
      },
    );
    return database;
  }

  Future<void> insertSurah(SurahBookmark data) async {
    final db = await database;
    await db.insert(_tableName, data.toJson());
  }

  Future<List<SurahBookmark>> getSurah() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName, orderBy: 'nomor ASC');
    debugPrint('results: $results');
    return results.map((res) => SurahBookmark.fromJson(res)).toList();
  }

  Future<void> deleteSurah(int nomor) async {
    final db = await database;
    debugPrint('||||| nomor: $nomor |||||');
    await db.delete(
      _tableName,
      where: 'nomor = ?',
      whereArgs: [nomor],
    );
  }
}