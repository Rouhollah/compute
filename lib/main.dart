import 'dart:convert';

import 'package:compute/description.dart';
import 'package:compute/product.dart';
import 'package:compute/shoppingBasket.dart';
import 'package:flutter/material.dart';
import 'shopBottomNavigator.dart';
import 'package:http/http.dart' as http;
import 'package:compute/branchesPage.dart';

void main() => runApp(MainMaterial());

class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stor(),
    );
  }
}

class Stor extends StatefulWidget {
  @override
  _StorState createState() => _StorState();
}

class _StorState extends State<Stor> {
  List<Product> productList = [];
  @override
  void initState() {
    super.initState();
    fetchItems();
  }

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
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.map,
                color: Colors.black45,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BranchesPage()));
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.black45,
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => ShoppingBasket()));
                // به جای استفاده از
                //MaterialPageRoute
                // می توان از انیمیشن های دیگری استفاده کرد
                Navigator.of(context).push(_createRoute());
              })
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(productList.length, (int position) {
            return generatorItem(productList[position], context);
          }),
        ),
      ),
      bottomNavigationBar: ShopBottomNavigator(),
      floatingActionButton: FloatingActionButton(
        onPressed: home(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void fetchItems() async {
    var url = "http://welearnacademy.ir/flutter/products_list.json";
    http.Response response = await http.get(url);
    var utf8Json = utf8.decode(response.bodyBytes);
    setState(() {
      var productJson = json.decode(utf8Json);
      for (var item in productJson) {
        Product product = new Product();
        product.id = item['id'];
        product.off = item['off'];
        product.price = item['price'];
        product.productName = item['product_name'];
        product.imageUrl = item['image_url'];
        product.description = item['description'];
        productList.add(product);
      }
    });
  }

  home() {}

  Card generatorItem(Product product, context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Description(product)));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 130,
                  width: 130,
                  child: Image.network(product.imageUrl)),
              Text(
                product.productName,
                style: TextStyle(fontFamily: "IranSans", fontSize: 14.0),
              ),
              Text(
                "قیمت: " + product.price,
                style: TextStyle(fontFamily: "IranSans", fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Route _createRoute2() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => ShoppingBasket(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }

Route _createRoute() {
  return PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondAnimation) {
        return ShoppingBasket();
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondAnimation, Widget widget) {
        return SlideTransition(
            child: widget,
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                .animate(animation));
      });
}
