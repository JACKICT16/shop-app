import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(20, 60, 109, 1.0), // กำหนดสีพื้นหลังเป็นสีน้ำเงิน
      body: Stack(
        children: [
          // GoogleMap(
          //   mapType: MapType.hybrid,
          //   initialCameraPosition: _kGooglePlex,
          //   onMapCreated: (GoogleMapController controller) {
          //     _controller.complete(controller);
          //   },
          // ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, //MainAxisAlignment.center ให้ Column จัดตำแหน่งของ Widget ที่อยู่ภายในให้อยู่ตรงกลางแกน Y ของ Column
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.shopping_cart),
                      label: Text(
                        'SHOP NOW',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
