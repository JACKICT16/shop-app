import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  // class จัดเก็บยืนยันตัวตนด้วย Firebase Authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> createNewUser(
      //ฟังก์ชันสร้างบัญชีผู้ใช้ใหมา่
      String email,
      String fullname,
      String phone,
      String password) async {
    String res = 'some error occurred';

    try {
      //ดักจับข้อผิดพลาด
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      res = 'success';
    } catch (e) {
      //ดักจับข้อผิดพลาด เช่น เมื่ออีเมลที่ใช้สร้างบัญชีมีอยู่ในระบบแล้ว
      res = e
          .toString(); //จะถูกรับรู้และนำมาเก็บไว้ในตัวแปร e    และค่าของสตริงนี้คือข้อความของข้อผิดพลาดที่เกิดขึ้น
    }

    return res;
  }
}
