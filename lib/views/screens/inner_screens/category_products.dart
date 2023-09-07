import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryProductScreen extends StatefulWidget {
  final dynamic categoryData;

  const CategoryProductScreen({super.key, this.categoryData});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('field')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryData['categoryName'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
      ),

// จะทำการดึงข้อมูลของ Product มาแสดงใน แต่ละ category 

      //   body: build(BuildContext context) {
      // return StreamBuilder<QuerySnapshot>(
      //   stream: _productsStream,
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Something went wrong');
      //     }

      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return ListView(
      //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
      //       Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      //         return ListTile(
      //           title: Text(data['full_name']),
      //           subtitle: Text(data['company']),
      //         );
      //       }).toList(),
      //     );
      //   },
      // );,
    );
  }
}
