import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:shop_app/views/screens/auth/register_screen.dart';
import 'package:shop_app/views/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;

  late String password;

  bool _isLoading = false;

  loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      String res = await _authController.loginUser(email, password);

      setState(() {
        _isLoading = false;
      });

      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });

        Get.to(MainScreen());
        //Get.to(MapScreen());
        //Get.to(() => MapScreen());
        Get.snackbar('Login Success', 'You Are Now logged in',
            backgroundColor: Colors.yellowAccent,
            colorText: Color.fromRGBO(20, 60, 109, 1.0));
      } else {
        Get.snackbar(
          'Error Occured',
          res.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 60, 109, 1.0),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //center of the screen
              children: [
                Text(
                  'PSU SMART CANTEEN',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color:
                          Color.fromARGB(255, 255, 200, 8) //ระยะห่างของตัวอักษร
                      ),
                ),
                Text(
                  'Please Login',
                  style: TextStyle(
                      fontSize: 15, letterSpacing: 2, color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Please Email Address Must Not Be Empty');
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter Email Address',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.yellowAccent,
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Please Password Must Not Be Empty');
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.yellowAccent,
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    loginUser();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 200, 8),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: _isLoading
                          ? CircularProgressIndicator(
                              color: Color.fromRGBO(20, 60, 109, 1.0),
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Need An Account?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
