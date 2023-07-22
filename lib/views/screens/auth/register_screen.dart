import 'package:flutter/material.dart';
import 'package:shop_app/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 60, 109, 1.0),
        body: Padding(
          padding: const EdgeInsets.all(15),
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
                height: 20,
              ),
              TextFormField(
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
              Container(
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
        ));
  }
}
