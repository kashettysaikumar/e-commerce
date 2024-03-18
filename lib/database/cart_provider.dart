
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cartmodel.dart';
import 'db.helper.dart';



class CartProvider with ChangeNotifier{

  DBHelper db = DBHelper();

  int _counter = 0;
  int get counter => _counter;

  double _totalprice = 0.0;
  double get totalprice => _totalprice;

  late Future<List<cartitems>>_cart;
  Future<List<cartitems>>get cart =>_cart;

  Future<List<cartitems>>getData()async{
    _cart= db.getCartList();
    return _cart;
  }

  void _setPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("cart_item", _counter);
    prefs.setDouble('total_price',_totalprice);
    notifyListeners();
  }
  void _getPrefItems()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalprice = prefs.getDouble("total_price") ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice (double productPrice){
    _totalprice=_totalprice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalprice(double productPrice){
    _totalprice=_totalprice - productPrice;
    _setPrefItems();
    notifyListeners();
  }
  double getTotalPrice (){
    _getPrefItems();
    return _totalprice ;
  }

  void addCounter (){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter(){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }
  int getCounter (){
    _getPrefItems();
    return _counter ;
  }
}