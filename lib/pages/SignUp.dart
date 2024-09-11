import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  String? name, password, eamil;
  TextEditingController emailcontrolller = TextEditingController();
  TextEditingController passwordcontrolller = TextEditingController();
  TextEditingController namecontrolller = TextEditingController();
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
                            'Sign',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins'),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                            controller: namecontrolller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Name',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontFamily: 'poppins'),
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Email';
                              }
                              return null;
                            },
                            controller: emailcontrolller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontFamily: 'poppins'),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter password';
                              }
                              return null;
                            },
                            controller: passwordcontrolller,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'password',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontFamily: 'poppins'),
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (fromkey.currentState!.validate()) {
                                setState(() {
                                  eamil = emailcontrolller.text;
                                  name = namecontrolller.text;
                                  password = passwordcontrolller.text;
                                });

                                registers(context);

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
                                  'SIGN UP',
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
                  'ALready have an account ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      fontSize: 17),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'login',
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

  void registers(BuildContext context) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eamil!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('weak password')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('email exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error')));
    }
  }
}
