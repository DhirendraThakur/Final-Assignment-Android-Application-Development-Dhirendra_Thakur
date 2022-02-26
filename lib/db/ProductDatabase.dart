import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fitness/model/product.dart';

class ProductDatabase {
  static final ProductDatabase instance = ProductDatabase.__init();

  static Database? _database;

  ProductDatabase.__init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('product.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const textType = 'TEXT';

    await
    db.execute('''
    CREATE TABLE $tableProduct (
      ${ProductFields.id} $textType,
      ${ProductFields.productname} $textType,
      ${ProductFields.producttype} $textType,
      ${ProductFields.productprice} $textType,
      ${ProductFields.pimage} $textType
    )
    ''');
  }

  Future<Product> create(Product product) async {
    final db = await instance.database;
    await db.insert(tableProduct, product.toJson());
    return product;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}