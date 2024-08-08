import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/cart/models/requests/cart_product_model.dart';
import 'storage_keys.dart';

class CartDatabase {
  Future<Database> get database async => await initDatabase();

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cartProducts.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${StorageKeys.cartProductsTable} (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ${StorageKeys.productId} INTEGER,
    ${StorageKeys.title} TEXT,
    ${StorageKeys.thumbnail} TEXT,
    ${StorageKeys.discountPrice} REAL,
    ${StorageKeys.oldPrice} REAL,
    ${StorageKeys.priceWithAttr} REAL,
    ${StorageKeys.qty} INTEGER,
    ${StorageKeys.color} TEXT,
    ${StorageKeys.size} TEXT,
    ${StorageKeys.category} INTEGER,
    ${StorageKeys.subcategory} INTEGER,
    ${StorageKeys.childCategory} INTEGER,
    ${StorageKeys.attributes} TEXT,
    ${StorageKeys.variantId} INTEGER,
    ${StorageKeys.attributesHash} TEXT,
    ${StorageKeys.taxOptionsSumRate} TEXT
    )   
    ''');
  }

  Future<int> insertData(CartProduct cartProduct) async {
    Database db = await database;
    return await db.insert(
      StorageKeys.cartProductsTable,
      cartProduct.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartProduct>> getData() async {
    Database db = await database;
    List<Map<String, dynamic>> products = await db.query(StorageKeys.cartProductsTable);
    return List<CartProduct>.from(products.map((product) => CartProduct.fromJson(product)));
  }

  Future<int> updateData(CartProduct cartProduct) async {
    Database db = await database;
    return await db.update(
      StorageKeys.cartProductsTable,
      cartProduct.toJson(),
      where: '${StorageKeys.productId} = ? and ${StorageKeys.attributesHash} = ?',
      whereArgs: [cartProduct.productId, cartProduct.attributesHash],
    );
  }

  Future<void> removeFromCart(int productId, String attributesHash) async {
    Database db = await database;
    await db.delete(
      StorageKeys.cartProductsTable,
      where: '${StorageKeys.productId} = ? and ${StorageKeys.attributesHash} = ?',
      whereArgs: [productId, attributesHash],
    );
  }

  Future<bool> checkIfAddedToCart(int productId, String attributesHash) async {
    Database db = await database;
    List<Map<String, dynamic>> data = await db.rawQuery(
      "SELECT * FROM ${StorageKeys.cartProductsTable} WHERE ${StorageKeys.attributesHash} = ? and ${StorageKeys.productId} = ?",
      [attributesHash, productId],
    );
    return data.isNotEmpty;
  }

  Future<int> deleteAllRows() async {
    Database db = await database;
    return await db.delete(StorageKeys.cartProductsTable);
  }
}
