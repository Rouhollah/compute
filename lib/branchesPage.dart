import 'dart:async';
import 'dart:convert';

import 'package:compute/branch.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class BranchesPage extends StatefulWidget {
  @override
  _BranchesPageState createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  Set<Marker> branchesList =<Marker>{} ;
  Completer<GoogleMapController> _controller = Completer();
  void onComplete(GoogleMapController controller) {
    this._controller.complete();
  }

  @override
  void initState() {
    super.initState();
    fetchPoints();
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
        elevation: 0,
      ),
      body: GoogleMap(
          markers: branchesList,
          onMapCreated: onComplete,
          initialCameraPosition:
              CameraPosition(target: LatLng(32.4279, 53.6880), zoom: 5)),
    );
  }

  void fetchPoints() async {
    String url = "http://welearnacademy.ir/flutter/branches.json";
    Response response = await get(url);
    setState(() {
      var jasonPoints = json.decode(utf8.decode(response.bodyBytes));
      for (var point in jasonPoints) {
        print(point);
        Branch b = new Branch();
        b.id = point['id'];
        b.lat = point['lat'];
        b.lng = point['lng'];
        b.shopName = point['shop_name'];
        b.manager = point['manager'] + ' ' + point['tel'];
        Marker marker = Marker(
          markerId: MarkerId(b.id.toString()),
          position: LatLng(b.lat, b.lng),
          infoWindow: InfoWindow(title: b.shopName, snippet: b.manager),
        );
        branchesList.add(marker);
      }
    });
  }
}
