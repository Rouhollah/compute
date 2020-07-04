
import 'product.dart';
import 'package:flutter/material.dart';

typedef OnRemovePressed(int index);

class ShoppingItem extends StatefulWidget {
  final Product _product;
  final int _index;
  final OnRemovePressed _onRemovePressed;
  ShoppingItem(
      this._product, this._onRemovePressed, this._index); //, this._count);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 180,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10, top: 5),
              child: Image.network(
                widget._product.imageUrl,
                width: 100,
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 10.0, right: 20, left: 20),
                  child: Text(
                    widget._product.productName,
                    style: TextStyle(fontFamily: 'IranSans', fontSize: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, right: 20),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            increment();
                          },
                          child: Icon(
                            Icons.chevron_right,
                            size: 35,
                          )),
                      Text(count.toString()),
                      GestureDetector(
                          onTap: () {
                            decrement();
                          },
                          child: Icon(
                            Icons.chevron_left,
                            size: 35,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () {
                        widget._onRemovePressed(widget._index);
                        // ShoppingData.getInstance()
                        //     .basketItems
                        //     .removeAt(widget._index);
                        //.basketItems
                        //.remove(widget._product);
                      },
                    ),
                    Text(widget._product.price)
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count == 0) {
        return;
      } else {
        count--;
      }
    });
  }
}
