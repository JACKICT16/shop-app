import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  // class จัดเก็บยืนยันตัวตนด้วย Firebase Authentication
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //ฐานข้อมูลในfirebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///Function selecte image from gallery or camera  //เลือกรูปภาพจากแกลลอรีหรือกล้องของอุปกรณ์ แล้วจะได้รับข้อมูลรูปภาพในรูปแบบ bytes กลับมา

  pickProfileImage(ImageSource Source) async {
    //ระบุแหล่งที่มาของรูปภาพ
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(
        source: Source); //เป็นคลาสที่เก็บข้อมูลของรูปภาพ

    if (_file != null) {
      //เมื่อค้นหารูปภาพเสร็จสิ้นแล้ว คำสั่งในบล็อกนี้จะทำงาน ถ้าพบรูปภาพและเลือกมาเรียบร้อยแล้ว
      return await _file
          .readAsBytes(); //อ่านข้อมูลรูปภาพในรูปแบบ bytes และส่งข้อมูลนั้นกลับออกไป
    } else {
      print('No Image Selected or Captured');
    }
  }

  Future<String> createNewUser(
      //ฟังก์ชันสร้างบัญชีผู้ใช้ใหมา่
      String email,
      String fullname,
      String phone,
      String password) async {
    String res = 'some error occurred';

    try {
      //ดักจับข้อผิดพลาด
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        //สร้างบัญชีผู้ใช้ใน Firebase Authentication และเพิ่มข้อมูลผู้ใช้ในคอลเลกชัน 'buyers' ของฐานข้อมูล Firestore พร้อมกัน
        'fullname': fullname,
        'email': email,
        'buyer_id': userCredential.user!.uid
      });

      res = 'success';
    } catch (e) {
      //ดักจับข้อผิดพลาด เช่น เมื่ออีเมลที่ใช้สร้างบัญชีมีอยู่ในระบบแล้ว
      res = e
          .toString(); //จะถูกรับรู้และนำมาเก็บไว้ในตัวแปร e    และค่าของสตริงนี้คือข้อความของข้อผิดพลาดที่เกิดขึ้น
    }

    return res;
  }
}
