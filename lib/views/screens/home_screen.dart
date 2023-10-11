import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/views/screens/widget/banner_widget.dart';
import 'package:shop_app/views/screens/widget/category_text_widget.dart';
import 'package:shop_app/views/screens/widget/home_menu.dart';
import 'package:shop_app/views/screens/widget/location_widget.dart';
import 'package:shop_app/views/screens/widget/reuseText.dart';

import 'inner_screens/vendor_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _statusStream =
        FirebaseFirestore.instance.collection('vendors').snapshots();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocationWidget(),
        SizedBox(
          height: 10,
        ),
        BannerWidget(),
        SizedBox(
          height: 10,
        ),
        CategoryTextWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Text(
                  'Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
            ],
          ),
        ),
        HomeMenuWidget(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
