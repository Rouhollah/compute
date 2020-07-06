import 'package:compute/shoppingData.dart';
import 'package:flutter/material.dart';
import 'product.dart';

class Description extends StatelessWidget {
  final Product _product;
  Description(this._product);
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
          elevation: 0,
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? verticalUi(context)
              : horizontalUi(context);
        }));
  }

  verticalUi(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(child: SizedBox(height: 15)),
        Container(
          child: Align(
            child: Text(
              "Shoes",
              style: TextStyle(color: Colors.red, fontSize: 35),
            ),
          ),
        ),
        Container(
            child: Image.network(_product.imageUrl, height: 300, width: 300)),
        Container(
          child: Text(_product.productName,
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        Container(
          child: Text(_product.price,
              style: TextStyle(color: Colors.green, fontSize: 20)),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                _product.description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              child: Align(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      ShoppingData.getInstance().basketItems.add(_product);
                      print(ShoppingData.getInstance().basketItems);
                    },
                    child: Center(
                        child: Text('افزودن به سبد خرید',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'IranSans'))),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }

  horizontalUi(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child:
                      Image.network(_product.imageUrl, height: 350, width: 350),
                  alignment: Alignment.center,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text(_product.productName,
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      Container(
                        child: Text(_product.price,
                            style:
                                TextStyle(color: Colors.green, fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      _product.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      ShoppingData.getInstance().basketItems.add(_product);
                      print(ShoppingData.getInstance().basketItems);
                    },
                    child: Text(
                      "افزدون به سبد خرید",
                      style: TextStyle(fontSize: 20, fontFamily: "IranSans"),
                    ),
                    color: Colors.green,
                    highlightColor: Colors.green[200],
                    textColor: Colors.white,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
