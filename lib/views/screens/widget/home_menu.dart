import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/views/screens/widget/menu_model.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _menuStream =
        FirebaseFirestore.instance.collection('menu').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _menuStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          height: 250,
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final menuData = snapshot.data!.docs[index];
              return MenuModel(
                menuData: menuData,
              );
            },
          ),
        );
      },
    );
  }
}
