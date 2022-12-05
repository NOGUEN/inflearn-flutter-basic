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
    return GetBuilder<AuthService>(
      builder: (authService) {
        final user = authService.currentUser();
        return Scaffold(
          appBar: AppBar(title: Text("로그인")),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                centerText(user),
                SizedBox(height: 32),
                textFieldWithCustomController(emailController, "이메일"),
                textFieldWithCustomController(passwordController, "비밀번호"),
                SizedBox(height: 32),
                loginButton(
                    authService, emailController, passwordController, context),
                signupButton(
                    authService, emailController, passwordController, context),
              ],
            ),
          ),
        );
      },
    );
  }
}

Center centerText(user) {
  return Center(
    child: Text(
      user == null ? "로그인해 주세요 🙂" : "${user.email}님 안녕하세요 👋",
      style: TextStyle(
        fontSize: 24,
      ),
    ),
  );
}

TextField textFieldWithCustomController(controller, String hintText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
  );
}

ElevatedButton loginButton(
    AuthService authService,
    TextEditingController emailController,
    TextEditingController passwordController,
    context) {
  return ElevatedButton(
    child: Text("로그인", style: TextStyle(fontSize: 21)),
    onPressed: () {
      authService.signIn(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("로그인 성공"),
          ));

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        onError: (err) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(err),
          ));
        },
      );
    },
  );
}

ElevatedButton signupButton(
    AuthService authService,
    TextEditingController emailController,
    TextEditingController passwordController,
    context) {
  return ElevatedButton(
    child: Text("회원가입", style: TextStyle(fontSize: 21)),
    onPressed: () {
      authService.signUp(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("회원가입 성공"),
          ));
        },
        onError: (err) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(err),
          ));
        },
      );
    },
  );
}
