import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shop_app/views/screens/auth/login_screen.dart';
// ignore: unused_import
import 'package:shop_app/views/screens/home_screen.dart';
import 'package:shop_app/views/screens/status_screen.dart'; // import หน้า LoginScreen เพื่อให้สามารถเรียกใช้ได้

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 60, 109, 1.0),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png', // ระบุที่อยู่ของรูปภาพ png ที่คุณนำเข้าในโครงการของคุณ
              width: 300, // กำหนดขนาดรูปภาพ
              height: 300,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enjoy Your Food',
                    style: TextStyle(
                      color: Color.fromRGBO(20, 60, 109, 1.0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return StatusScreen(); // เปลี่ยนเป็นหน้า LoginScreen ที่คุณต้องการ
                        }));
                      },
                      icon: Icon(CupertinoIcons.shopping_cart),
                      label: Text(
                        'CHECK STATUS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
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
