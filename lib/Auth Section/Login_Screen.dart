// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_button.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_notification.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_textfield.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  //validator field yang kosong
  bool isSignInPressed = false;

  bool isFormValid() {
    if (isSignInPressed) {
      return !isTextFieldEmpty(EmailController) &&
          !isTextFieldEmpty(PasswordController);
    }
    return true;
  }

  //Sign In Function
  void SignIn() async {
    //jaga jaga loading
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    //sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);

      if (context.mounted) Navigator.pop(context);
    }
    //kalau error
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      allertmessage("Inavlid Email or Password", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainRed,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100))),
            ),
          ),

          //Sign in container
          Center(
            child: Container(
              height: 393,
              width: 314,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [FormatShadow]),

              //Isi container
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //Title
                      Text(
                        'Sign In',
                        style: LoRegStyle,
                      ),
                      SizedBox(
                        height: 32,
                      ),

                      //Input Text Field (Email dan Password)
                      My_Textfield(
                        readonly: false,
                        controller: EmailController,
                        HintText: 'Email',
                        ObscureText: false,
                        Errortext:
                            isSignInPressed && isTextFieldEmpty(EmailController)
                                ? 'Field ini harus diisi'
                                : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              EmailController.text = value;
                            });
                          } else {
                            setState(() {
                              EmailController.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      My_Textfield(
                        readonly: false,
                        controller: PasswordController,
                        HintText: 'Password',
                        ObscureText: true,
                        Errortext: isSignInPressed &&
                                isTextFieldEmpty(PasswordController)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              PasswordController.text = value;
                            });
                          } else {
                            setState(() {
                              PasswordController.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 47,
                      ),

                      //button
                      My_Button(
                        NamaTombol: 'Sign In',
                        onTap: SignIn,
                      ),

                      SizedBox(
                        height: 3,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text(
                              'Don\'t have an Account?',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'Register');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: SignInUp2,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
