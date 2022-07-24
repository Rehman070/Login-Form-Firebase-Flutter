import 'package:flutter/material.dart';
import 'package:login_form_complete/Sign_up_Screen.dart';
import 'Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login_Screen extends StatefulWidget {
  Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void Signin() async {
    String Email = emailcontroller.text.trim();
    String Password = passcontroller.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      Fluttertoast.showToast(msg: "Sucessfully Login!");

      if (userCredential.user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home_Screen()),
            (route) => false);
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "invalid-email") {
        Fluttertoast.showToast(msg: "invalid email");
      } else if (ex.code == "wrong-password") {
        Fluttertoast.showToast(msg: "wrong password");
      } else if (ex.code == "user-not-found") {
        Fluttertoast.showToast(msg: "user no found");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/loginn.png',
                      width: 400,
                      height: 250,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Your UserName';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passcontroller,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return Sign_up();
                          }));
                        },
                        child: const Text('Create an Account?',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ))),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40, top: 20, bottom: 20),
                                primary: Colors.pink,
                                onPrimary: Colors.white,
                                shadowColor: Colors.black,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    });
                                Signin();
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a member?',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(CupertinoPageRoute(builder: (context) {
                                return Sign_up();
                              }));
                            },
                            child: const Text('Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ))),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
