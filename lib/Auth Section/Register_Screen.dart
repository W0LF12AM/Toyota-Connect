// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mk_tutorial/Auth%20Section/Login_Screen.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_button.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_notification.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_textfield.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class Register_Screen extends StatefulWidget {
  Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ConfirmPassController = TextEditingController();
  final UserNameController = TextEditingController();

  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  //validator field
  bool isSignUpPressed = false;

  bool isFormValid() {
    if (isSignUpPressed) {
      return !isTextFieldEmpty(UserNameController) &&
          !isTextFieldEmpty(EmailController) &&
          !isTextFieldEmpty(PasswordController) &&
          !isTextFieldEmpty(ConfirmPassController);
    }
    return true;
  }

  //Sign Up Function
  void SignUp() async {
    //validator errortextnya
    setState(() {
      isSignUpPressed = true;
    });

    //loop circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    //pasword benul
    if (PasswordController.text != ConfirmPassController.text) {
      //loop circle
      Navigator.pop(context);

      //pesan ewow
      allertmessage("Password don't match!", context);
    } else {
      //bikin akun
      try {
        if (isFormValid()) {
          // bikin user
          UserCredential? usercredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: EmailController.text,
                  password: PasswordController.text);

          //bikin data trus up ke firebase
          createUserDocument(usercredential);

          //loop circle
          if (context.mounted) Navigator.pop(context);

          //pindah halaman
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => Login_Screen()));
        } else {
          Navigator.pop(context);
          allertmessage('Harap isi semua kolom', context);
        }
      } on FirebaseAuthException catch (e) {
        //Loop circle
        Navigator.pop(context);

        //pesan ewow
        allertmessage(e.code, context);
      }
    }
  }

  //bikin dokumen user sama ngambil data dari firestore
  Future createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': UserNameController.text,
      });
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
              height: 540,
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
                        'Sign Up',
                        style: LoRegStyle,
                      ),
                      SizedBox(
                        height: 32,
                      ),

                      //Input Text Field

                      //email
                      My_Textfield(
                        readonly: false,
                        controller: UserNameController,
                        HintText: 'Username',
                        ObscureText: false,
                        Errortext: isSignUpPressed &&
                                isTextFieldEmpty(UserNameController)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              UserNameController.text = value;
                            });
                          } else {
                            setState(() {
                              UserNameController.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 13,
                      ),

                      //nama
                      My_Textfield(
                        readonly: false,
                        controller: EmailController,
                        HintText: 'Email',
                        ObscureText: false,
                        Errortext:
                            isSignUpPressed && isTextFieldEmpty(EmailController)
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
                        height: 13,
                      ),

                      //password
                      My_Textfield(
                        readonly: false,
                        controller: PasswordController,
                        HintText: 'Password',
                        ObscureText: true,
                        Errortext: isSignUpPressed &&
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
                        height: 13,
                      ),

                      //confirm password
                      My_Textfield(
                        readonly: false,
                        controller: ConfirmPassController,
                        HintText: 'Confirm Password',
                        ObscureText: true,
                        Errortext: isSignUpPressed &&
                                isTextFieldEmpty(ConfirmPassController)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              ConfirmPassController.text = value;
                            });
                          } else {
                            setState(() {
                              ConfirmPassController.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 47,
                      ),

                      //button
                      My_Button(
                        NamaTombol: 'Sign Up',
                        onTap: SignUp,
                      ),

                      SizedBox(
                        height: 1,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text(
                              'Already have an Account?',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Login_Screen()));
                                },
                                child: Text(
                                  'Sign In',
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
