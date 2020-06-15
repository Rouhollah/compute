import 'product.dart';
import 'package:flutter/material.dart';

class ShoppingItem extends StatefulWidget {

   final Product product=new Product();
  ShoppingItem(product);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10,left: 10,top: 5),
              child: Image.network(
                widget.product.imageUrl,
                width: 100,
                height: 100,
                ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.product.productName,
                  style: TextStyle(fontFamily: 'IranSans',fontSize: 12),
                ),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Icon(Icons.chevron_right)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
