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
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Align(
            child: Text(
              "Shoes",
              style: TextStyle(color: Colors.red, fontSize: 35),
            ),
          ),
          Image.network(_product.imageUrl, height: 300, width: 300),
          Text(_product.productName,
              style: TextStyle(color: Colors.black, fontSize: 20)),
          Text(_product.price,
              style: TextStyle(color: Colors.green, fontSize: 20)),
          Expanded(
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
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green,
                ),
                child: Center(
                 child: Text('افزودن به سبد خرید',
                  style:TextStyle(
                    color:Colors.white,
                    fontSize: 14,
                    fontFamily: 'IranSans'
                  ))
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          )
        ],
      ),
    );
  }
}
