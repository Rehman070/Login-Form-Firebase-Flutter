import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_form_complete/Home_Screen.dart';
import 'package:flutter/cupertino.dart';

class Sign_up extends StatefulWidget {
  Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

  //Declare a Variables
  final formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController cpasscontroller = TextEditingController();

  // Create a function for create a User
  void CreateAccounts() async {
    String Email = emailcontroller.text.trim();
    String Password = passcontroller.text.trim();
    String CPassword = cpasscontroller.text.trim();

    if (Password != CPassword) {
      Fluttertoast.showToast(msg: "password doesn't match");
    } else if (Password.length < 8) {
      Fluttertoast.showToast(msg: "password length should be >=8");
    } else {
      try {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            });
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: Email, password: Password);
        Fluttertoast.showToast(msg: "Account Sucessfully Created!");

        if (userCredential.user != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home_Screen()),
              (route) => false);
        }
      } on FirebaseAuthException catch (ex) {
        if (ex.code == "email-already-in-use") {
          Fluttertoast.showToast(msg: "Email already exist!");
        } else if (ex.code == "invalid-email") {
          Fluttertoast.showToast(msg: "Invalid Email");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Sign Up'),
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
                      'assets/images/Sign_up.png',
                      width: 400,
                      height: 250,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Your UserName';
                        }
                        return null;
                      },
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
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: cpasscontroller,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Confirm Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        labelText: 'Confirm Password',
                        hintText: 'Enter Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Already have an Account?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17))),
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
                                CreateAccounts();
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
