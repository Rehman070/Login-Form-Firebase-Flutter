import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_form_complete/Home_Screen.dart';
import 'package:login_form_complete/Login_Screen.dart';
import 'package:login_form_complete/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Form',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: (FirebaseAuth.instance.currentUser != null)
          ? Home_Screen()
          : Login_Screen(),
    );
  }
}
