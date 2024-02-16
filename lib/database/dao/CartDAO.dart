import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:custom_bloc_state_management/database/MyAppDatabase.dart';
import 'package:custom_bloc_state_management/database/table/SessionsTable.dart';
import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';
import 'package:sqflite/sql.dart';

class CartDAO {
  final MyAppDatabase dbProvider;

  CartDAO([MyAppDatabase? dbProvider])
      : dbProvider = dbProvider ?? MyAppDatabase.dbProvider;

  Future<void> insertCart({required List<CartModel> cartList}) async {
    final db = await dbProvider.database;
    for(final cart in cartList) {
    await db.insert('carts', cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Sql >>>>>}");

    for (var product in cart.productModel) {
      product.localThumbnail = await imageUrlToBase64(product.thumbnailProduct);
      await db.insert('products', product.toMap());
    }
  }
  }
  Future<String> imageUrlToBase64(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        final List<int> bytes = response.bodyBytes;
        return base64Encode(bytes);
      } else {
        // Handle error if the image couldn't be fetched
        print("Error: ${response.statusCode}");
        return "";
      }
    } catch (e) {
      // Handle other exceptions
      print("Exception: $e");
      return "";
    }
  }



  Future<List<CartModel>> getAllCarts() async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> cartMaps = await db.query('carts');
    final List<CartModel> carts = [];

    for (final cartMap in cartMaps) {
      final List<Map<String, dynamic>> productMaps = await db.query(
        'products'
      );

      final List<ProductsModel> products = productMaps
          .map((productMap) => ProductsModel.fromMap(productMap))
          .toList();

      final CartModel cart = CartModel.fromMap(cartMap, products);
      carts.add(cart);
    }

    return carts;
  }

}
