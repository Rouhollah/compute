import 'package:compute/shoppingData.dart';
import 'package:compute/shoppingItem.dart';
import 'package:flutter/material.dart';

class ShoppingBasket extends StatefulWidget {

  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();

}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "فروشگاه",
              style: TextStyle(color: Colors.black45, fontFamily: "IranSans"),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
            elevation: 0),
        body: basketUi());
  }

  Widget basketUi() {
    return ListView.builder(
        itemCount: ShoppingData.getInstance().basketItems.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            child: Padding(
              child: ShoppingItem(ShoppingData.getInstance().basketItems[position]),
              padding: EdgeInsets.all(5.0),
            ),
          );
        });
  }
}
