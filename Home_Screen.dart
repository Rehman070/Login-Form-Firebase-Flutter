import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_form_complete/Login_Screen.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login_Screen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    logout();
                  },
                  icon: const Icon(Icons.logout))
            ],
            automaticallyImplyLeading: false,
            title: const Text(
              'Home',
              // style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          body: const Center(
            child: Text('Welcome Home'),
          )),
    );
  }
}
