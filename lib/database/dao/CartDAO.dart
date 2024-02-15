
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
    for (var product in cart.productModel) {
      await db.insert('products', product.toMap());
    }
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
