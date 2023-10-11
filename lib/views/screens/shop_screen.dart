import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'inner_screens/vendor_list.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _statusStream =
        FirebaseFirestore.instance.collection('vendors').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _statusStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // กำหนดให้มี 1 แถว
                  childAspectRatio: 240 / 80, // ความสูง / ความกว้าง
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final vendorData = snapshot.data!.docs[index];
                  bool isOpen = vendorData[
                      'status']; // Assuming 'status' field contains a boolean value

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VendorListScreen(
                              vendorData: vendorData,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, // แนวนอน
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // ตำแหน่งของ children ในแนวตั้ง
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                vendorData['storeImage'],
                                width: 80,
                                height: 80,
                              ),
                            ),
                            SizedBox(
                              width: 20, // ระยะห่างระหว่างรูปภาพและข้อความ
                            ),
                            // จัดให้อยู่ที่บนสุด
                            Expanded(
                              child: Align(
                                alignment:
                                    Alignment.center, // จัดให้เป็นตรงกลาง
                                child: Text(
                                  vendorData['shopName'].toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Container(
                              height: 80,
                              width: 100,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isOpen ? Colors.green : Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isOpen
                                        ? Icons.access_time
                                        : Icons.access_time,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                      width:
                                          6), // ระยะห่างระหว่างไอคอนและข้อความ
                                  Text(
                                    isOpen ? 'Open' : 'Close',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
