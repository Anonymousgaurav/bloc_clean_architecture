import 'package:sqflite/sqflite.dart';

class CartTable {
  static const String PRODUCTS_TABLE_NAME = "carts";

  static void createTable(Database database, int version) async {
    await database.execute('''
          CREATE TABLE carts(
            id INTEGER PRIMARY KEY,
            total INTEGER,
            discountedTotal INTEGER,
            userId INTEGER,
            totalProducts INTEGER,
            totalQuantity INTEGER
          )
        ''');

    await database.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            quantity INTEGER,
            total REAL,
            discountPercentage REAL,
            discountedPrice REAL,
            thumbnail TEXT,
            cartId INTEGER,
            localThumbnail TEXT,
            FOREIGN KEY (cartId) REFERENCES carts (id) ON DELETE CASCADE
          )
        ''');  }
}
