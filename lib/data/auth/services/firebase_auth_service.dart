import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/data/app_data.dart';

class FirebaseAuthService {
  Future<Either> register(RegisterRequest request) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(
            data.user!.uid,
          )
          .set({
        'firstName': request.firstName,
        'lastName': request.lastName,
        'email': request.email,
        'gender': request.gender,
        'age': request.age,
        'image': data.user!.photoURL,
        'requestId': data.user!.uid,
      });

      return const Right(
        'Đăng ký tài khoản thành công',
      );
    } on FirebaseAuthException catch (e) {
      var message = '';

      if (e.code == 'weak-password') {
        message = 'Mật khẩu yếu';
      } else if (e.code == 'email-already-in-use') {
        message = 'Tài khoản đã tồn tại';
      }
      return Left(message);
    }
  }

  Future<Either> getAges() async {
    try {
      final returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Xin thử lại!');
    }
  }

  Future<Either> login(LoginRequest request) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
      return const Right('Đăng nhập thành công');
    } on FirebaseAuthException catch (e) {
      var message = '';
      if (e.code == 'invalid-email') {
        message = 'Tài khoản không tồn tại';
      } else if (e.code == 'invalid-credential') {
        message = 'Email hoặc mật khẩu không đúng';
      }
      return Left(message);
    }
  }

  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Vui lòng kiểm tra email');
    } catch (e) {
      return const Left('Xin hãy thử lại');
    }
  }

  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<Either> getUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return const Left('Xin hãy thử lại');
    }
  }
}
