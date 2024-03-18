import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../model/cartmodel.dart';



class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
   // io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE cart (
        id INTEGER PRIMARY KEY , 
        title TEXT,
        description TEXT,
        price INTEGER ,
        brand TEXT,
        category TEXT,
        stock INTEGER,
        thumbnail TEXT,
        totalPrice INTEGER,
        initialPrice INTEGER, 
        quantity INTEGER
        )''');

    await db.execute(
        '''CREATE TABLE favorite(
        id INTEGER PRIMARY KEY , 
        title TEXT,
        description TEXT,
        price INTEGER ,
        brand TEXT,
        category TEXT,
        stock INTEGER,
        thumbnail TEXT,
        totalPrice INTEGER,
        initialPrice INTEGER, 
        quantity INTEGER
        )''');

  }
  Future<cartitems> insert(cartitems cart) async {
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<cartitems>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('cart');
    return queryResult.map((e) => cartitems.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete("cart", where: 'id=?', whereArgs: [id]);
  }

  Future<int>updateQuantity(cartitems cart)async{
    var dbClient = await db;
    return await dbClient!.update('cart',cart.toMap(),
        where: 'id=?',
        whereArgs: [cart.id]
    );
  }

  //fav

  Future<cartitems>insert_fav(cartitems favorite) async {
    var dbClient = await db;
    await dbClient!.insert('favorite', favorite.toMap());
    return favorite;
  }

  Future<List<cartitems>> getfavoriteList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('favorite');
    return queryResult.map((e) => cartitems.fromMap(e)).toList();
  }

  Future<int>favdelete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete("favorite", where: 'id=?', whereArgs: [id]);
  }

}
