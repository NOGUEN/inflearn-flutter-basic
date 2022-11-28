import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import '../auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로그인")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 현재 유저 로그인 상태
            Center(
              child: Text(
                "로그인해 주세요 🙂",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 32),
            emailTextField(emailController),
            passwordTextField(passwordController),
            SizedBox(height: 32),
            logIntButton(context),
            signUpButton(emailController, passwordController),
          ],
        ),
      ),
    );
  }
}

TextField emailTextField(TextEditingController emailController) {
  return TextField(
    controller: emailController,
    decoration: InputDecoration(hintText: "이메일"),
  );
}

TextField passwordTextField(TextEditingController passwordController) {
  return TextField(
    controller: passwordController,
    obscureText: false, // 비밀번호 안보이게
    decoration: InputDecoration(hintText: "비밀번호"),
  );
}

ElevatedButton logIntButton(BuildContext context) {
  return ElevatedButton(
    child: Text("로그인", style: TextStyle(fontSize: 21)),
    onPressed: () {
      // 로그인 성공시 HomePage로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    },
  );
}

ElevatedButton signUpButton(TextEditingController emailController,
    TextEditingController passwordController) {
  return ElevatedButton(
    child: Text("회원가입", style: TextStyle(fontSize: 21)),
    onPressed: () {
      AuthService authService = Get.find();

      authService.signUp(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: () {
          // 회원가입 성공
          print("회원가입 성공");
        },
        onError: (err) {
          // 에러 발생
          print("회원가입 실패 : $err");
        },
      );
    },
  );
}
