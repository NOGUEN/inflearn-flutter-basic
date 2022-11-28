import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  User? currentUser() {}

  void signUp({
    required String email,
    required String password,
    required Function onSuccess,
    required Function(String err) onError,
  }) async {
    // 회원가입
  }

  void signIn({
    required String email,
    required String password,
    required Function onSuccess,
    required Function(String err) onError,
  }) async {
    // 로그인
  }

  void signOut() async {
    // 로그아웃
  }
}
