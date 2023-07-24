import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/views/screens/auth/login_screen.dart'; // import หน้า LoginScreen เพื่อให้สามารถเรียกใช้ได้

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(20, 60, 109, 1.0), // กำหนดสีพื้นหลังเป็นสีน้ำเงิน
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enjoy Your Food', // ข้อความต้อนรับ
                style: TextStyle(
                  color: Colors.white, // กำหนดสีตัวอักษรเป็นสีขาว
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // ตัวอย่างการทำงานเมื่อกดปุ่ม Get Started
                  Get.to(
                      LoginScreen()); // ใช้ Get.to() เพื่อเปิดหน้า LoginScreen
                },
                child: Text('Get Started'), // ข้อความปุ่ม
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // กำหนดสีพื้นหลังของปุ่มเป็นสีขาว
                  textStyle: TextStyle(
                    color: Colors.blue, // กำหนดสีตัวอักษรในปุ่มเป็นสีน้ำเงิน
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // ตัวอย่างการทำงานเมื่อกดปุ่ม Back
                  Get.back(); // ใช้ Get.back() เพื่อกลับไปหน้าก่อนหน้า
                },
                child: Text('Back'), // ข้อความปุ่ม Back
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // กำหนดสีพื้นหลังของปุ่มเป็นสีขาว
                  textStyle: TextStyle(
                    color: Colors.blue, // กำหนดสีตัวอักษรในปุ่มเป็นสีน้ำเงิน
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
