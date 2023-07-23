import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:shop_app/views/screens/auth/login_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();
  //สร้างอ็อบเจ็กต์ของคลาส AuthController ที่เป็นตัวแปร _authController และกำหนดให้เป็นค่าสุดท้าย (final) ได้รับค่าแล้ว จะไม่สามารถเปลี่ยนแปลงค่าได้ในภายหลัง
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String email;

  late String fullname;

  late String phone;

  late String password;

// การใส่ ? ของตัวแปร กล่าวคือ ตัวแปรนั้นจะมีค่าเป็น null ได้
  Uint8List? _image;

  selectGalleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  captureImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);

    setState(() {
      _image = im;
    });
  }

  registerUser() async {
    if (_image != null) {
      if (_formkey.currentState!.validate()) {
        String res = await _authController.createNewUser(
            email, fullname, phone, password, _image);

        if (res == 'success') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            //นำผู้ใช้ที่สร้างใหม่ไปยังหน้าจอ LoginScreen ด้วยการใช้ Navigator เพื่อเปิดหน้าจอใหม่โดยที่ผู้ใช้จะได้เข้าสู่ระบบหลังจากที่สร้างบัญชีผู้ใช้สำเร็จแล้ว
            return LoginScreen();
          }));
        }
      } else {
        print('Not Valid');
      }
    } else {
      print('No Image Picked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 60, 109, 1.0),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PSU SMART CANTEEN',
                      style: TextStyle(
                        fontSize: 25, // เพิ่มขนาดตัวอักษรใหญ่ขึ้นเป็น 30
                        fontWeight: FontWeight.bold, // ทำให้ตัวอักษรหนาขึ้น
                        letterSpacing:
                            4, // เพิ่มระยะห่างของตัวอักษรเพื่อทำให้นูนมากขึ้น
                        color: Color.fromARGB(255, 255, 200, 8),
                      ),
                    ),
                    Text(
                      'Register Account?',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      //Stack ใช้สำหรับการจัดวางองค์ประกอบใน Flutter โดยสามารถวางองค์ประกอบลงมาบนองค์ประกอบอื่น ๆ แบบใกล้ชิดกัน
                      children: [
                        _image == null
                            ? CircleAvatar(
                                //สร้างโปรไฟล์อวตาร
                                radius: 65,
                                child: Icon(
                                  Icons.person,
                                  size: 70,
                                  color: Color.fromRGBO(20, 60, 109, 1.0),
                                ),
                              )
                            : CircleAvatar(
                                //สร้างโปรไฟล์อวตาร
                                radius: 65,
                                backgroundImage: MemoryImage(_image!),
                              ),
                        Positioned(
                          right: 0,
                          top: 15,
                          child: IconButton(
                            onPressed: () {
                              selectGalleryImage();
                            },
                            icon: Icon(
                              CupertinoIcons.photo,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'Please Email Address Must Not Be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'Enter Email Address',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.yellowAccent,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        fullname = value;
                      },
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'Please Email Address Must Not Be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter Fullname',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.yellowAccent,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        phone = value;
                      },
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'Please Phone Number Must Not Be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter Phone',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.yellowAccent,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Password Must Not Be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.yellowAccent,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      //ปุ่มตรวจสอบว่าใส่ข้อมูลลงไปไหม
                      onTap: () {
                        registerUser();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 200, 8),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }),
                        );
                      },
                      child: Text(
                        'Already Have An Account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
