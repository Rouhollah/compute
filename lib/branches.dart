import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Branches extends StatefulWidget {
  @override
  _BranchesState createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {
  Completer<GoogleMapController> _controller = Completer();
  void onComplete(GoogleMapController controller) {
    this._controller.complete();
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
        onMapCreated: onComplete,
        initialCameraPosition: CameraPosition(
          target: LatLng(36.262602,59.609900),
          zoom: 5
          )
          ),
    );
  }
}
