import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorListScreen extends StatefulWidget {
  final dynamic vendorData;

  const VendorListScreen({Key? key, required this.vendorData})
      : super(key: key);

  @override
  State<VendorListScreen> createState() => _VendorListScreenState();
}

class _VendorListScreenState extends State<VendorListScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('menu')
        .where('shopName', isEqualTo: widget.vendorData['shopName'])
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.vendorData['shopName'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _productsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No menu in this shop',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            );
          }

          return GridView.builder(
            itemCount: snapshot.data!.size,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 200 / 300,
            ),
            itemBuilder: (context, index) {
              final menuData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              if (menuData['menuImages'] != null &&
                  menuData['menuImages'] is List &&
                  menuData['menuImages'].isNotEmpty) {
                return Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              menuData['menuImages'][0],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menuData['menuName'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        (menuData['menuPrice'] ?? 0).toString() + ' ฿',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else {
                return Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Placeholder(
                        fallbackHeight: 170,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menuData['menuName'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        (menuData['menuPrice'] ?? 0).toString() + ' ฿',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
