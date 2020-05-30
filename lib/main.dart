import 'dart:convert';

import 'package:compute/description.dart';
import 'package:compute/product.dart';
import 'package:flutter/material.dart';
import 'shopBottomNavigator.dart';
import 'package:http/http.dart' as http;

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
          Icon(
            Icons.map,
            color: Colors.black45,
          )
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
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    var utf8Json = utf8.decode(response.bodyBytes);
    setState(() {
      var productJson = json.decode(utf8Json);
      for (var item in productJson) {
        print(item);
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
          Navigator.of(context).push(MaterialPageRoute(
            builder:(context) =>Description(product)
                        )
            );
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
