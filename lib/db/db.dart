import 'package:shop_app/Models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  Database? _database;
  Future<Database> get database async {
    _database = await initDB();
    return _database!;
  }

  Future initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'saved.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(
            'CREATE TABLE products(id INTEGER PRIMARY KEY, title TEXT,description TEXT, price DOUBLE, imageUrl TEXT, isFav BOOL)');
      },
    );
  }

  Future insert(Product p) async {
    final db = await _database!;

    await db.insert('products', p.toMap());
  }

  Future<List<Product>> getAll() async {
    final db = await _database!;
    final data = await db.query('products');
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
