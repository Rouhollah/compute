import 'package:compute/product.dart';

class ShoppingData {
  static ShoppingData _instance;
  List<Product> basketItems;
  ShoppingData() {
    basketItems = List<Product>();
  }

  static ShoppingData getInstance() {
    if (_instance == null) {
      _instance = ShoppingData();
    }
    return _instance;
  }

//   List<Product> get basketItems => _basketItems;
//   set basketItems(List<Product> value) {
//     _basketItems = value;
//   }
 }
