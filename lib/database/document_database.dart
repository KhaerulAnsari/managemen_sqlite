// ignore_for_file: prefer_const_declarations, depend_on_referenced_packages

import 'package:managemen_sqlite/model/document.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DocumentDatabase {
  static final DocumentDatabase instance = DocumentDatabase._init();

  static Database? _database;

  DocumentDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute(''' 
      CREATE TABLE $tableDocument (
        ${DocumentFields.id} $idType,
        ${DocumentFields.scheduleNumber} $textType,
        ${DocumentFields.impectionNumber} $textType,
        ${DocumentFields.policeNumber} $textType,
        ${DocumentFields.vin} $textType,
        ${DocumentFields.engineNumber} $textType,
        ${DocumentFields.bodyNumber} $textType,
        ${DocumentFields.model} $textType,
        ${DocumentFields.jobType} $textType,
        ${DocumentFields.houmeter} $textType,
        ${DocumentFields.kilometer} $textType,
        ${DocumentFields.priority} $textType,
        ${DocumentFields.customer} $textType,
        ${DocumentFields.foreman} $textType,
        ${DocumentFields.timeStartDate} $textType,
        ${DocumentFields.timeEndDate} $textType,
        ${DocumentFields.remark} $textType,
        ${DocumentFields.status} $textType,
        ${DocumentFields.time} $textType
      )
     ''');
  }

  Future<Document> create(Document document) async {
    final db = await instance.database;

    final id = await db.insert(tableDocument, document.toJson());
    return document.copy(id: id);
  }

  Future<Document> readDocument(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableDocument,
      columns: DocumentFields.values,
      where: '${DocumentFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Document.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Document>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${DocumentFields.time} ASC';
    final result = await db.query(tableDocument, orderBy: orderBy);
    return result.map((json) => Document.fromJson(json)).toList();
  }

  Future<int> update(Document document) async {
    final db = await instance.database;

    return db.update(
      tableDocument,
      document.toJson(),
      where: '${DocumentFields.id} = ?',
      whereArgs: [document.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDocument,
      where: '${DocumentFields.id} = ? ',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
