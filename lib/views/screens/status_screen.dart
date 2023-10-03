import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/views/screens/auth/login_screen.dart';
import 'package:shop_app/views/screens/inner_screens/vendor_list.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _statusStream =
        FirebaseFirestore.instance.collection('vendors').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.store),
            SizedBox(
              width: 5,
            ),
            Text(
              'Status',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
          ],
        ),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(20, 60, 109, 1.0), // ตั้งค่าพื้นหลัง
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png', // ระบุที่อยู่ของรูปภาพ png ที่คุณนำเข้าในโครงการของคุณ
                width: 100, // กำหนดขนาดรูปภาพ
                height: 100,
              ),
            ),
            Text(
              'PSU SMART CANTEEN',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: Color.fromARGB(255, 255, 200, 8),
              ),
            ),
            Text(
              'Shop Status',
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen(); // เปลี่ยนเป็นหน้า LoginScreen ที่คุณต้องการ
                    }));
                  },
                  icon: Icon(
                    CupertinoIcons.shopping_cart,
                  ),
                  label: Text(
                    'SHOP NOW',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _statusStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final vendorData = snapshot.data!.docs[index];
                        // GestureDetector() แตะหน้าจอ ทัช (touch)
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return VendorListScreen(
                                    //ไว้กดที่หน้าร้านค้า
                                    vendorData: vendorData,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: Offset(0, 2), //เงา
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  vendorData['storeImage'],
                                  width: 80,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  vendorData['shopName'].toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
