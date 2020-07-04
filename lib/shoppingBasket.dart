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
              "سبد خرید",
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
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom:70 ),
                  child: ListView.builder(
              itemCount: ShoppingData.getInstance().basketItems.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  child: Padding(
                    child: ShoppingItem(
                        ShoppingData.getInstance().basketItems[position],
                        removeItem,
                        position),
                    padding: EdgeInsets.all(5.0),
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Center(
                    child: Text(
                      'پرداخت',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'IranSans'),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingData.getInstance().basketItems.removeAt(index);
    });
  }
}
