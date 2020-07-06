import "package:flutter/material.dart";

import 'login.dart';

class ShopBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightGreen,
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.home),
                    InkWell(
                      child: Icon(Icons.person),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    )
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.search),
                    Icon(Icons.shopping_basket)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
