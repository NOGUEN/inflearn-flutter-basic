import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/auth_service.dart';
import 'bucket/bucket_service.dart';
import 'view/home_page.dart';
import 'view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthService());
  Get.put(BucketService());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthService>(
      builder: (authService) {
        final user = authService.currentUser();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: user == null ? LoginPage() : HomePage(),
        );
      },
    );
  }
}
