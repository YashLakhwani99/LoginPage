// ignore_for_file: sized_box_for_whitespace, prefer_final_fields

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool revealPassword = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextStyle textFieldStyle() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (emailString) {
                              if (emailString == null ||
                                  emailString.isEmpty ||
                                  !emailString.contains('@')) {
                                return "invalid email address";
                              }
                              return null;
                            },
                            style: textFieldStyle(),
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              hintText: "email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (passwordString) {
                              if (passwordString == null ||
                                  passwordString.isEmpty) {
                                return "invalid password";
                              }
                              if (passwordString.length < 6) {
                                return "weak password";
                              }
                              return null;
                            },
                            obscureText: !revealPassword,
                            style: textFieldStyle(),
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              hintText: "1234",
                              suffixIcon: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  setState(() {
                                    revealPassword = !revealPassword;
                                  });
                                },
                                icon: Icon(
                                  revealPassword == false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: Card(
                        elevation: 4.0,
                        child: Container(
                          height: 60.0,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Create new account",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
