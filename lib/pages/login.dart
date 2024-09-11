import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? password, email;

  TextEditingController emailcontrolller = TextEditingController();

  TextEditingController passwordcontrolller = TextEditingController();

  var fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(color: Colors.red),
          ),
          Container(
            margin: const EdgeInsets.only(top: 260),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 110),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 450,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: Form(
                      key: fromkey,
                      child: Column(
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins'),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          TextFormField(
                            controller: emailcontrolller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Eamil';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontFamily: 'poppins'),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          TextFormField(
                            controller: passwordcontrolller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: 'password',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontFamily: 'poppins'),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (fromkey.currentState!.validate()) {
                                setState(() {
                                  email = emailcontrolller.text;

                                  password = passwordcontrolller.text;
                                });
                                loginIn(context);

                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 590),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      fontSize: 17),
                ),
                TextButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUP(),
                          ));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<void> loginIn(BuildContext context) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'wrong password',
        )));
      }
    }
  }
}
