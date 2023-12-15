// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mk_tutorial/Auth%20Section/Login_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/MainMenu_Screen.dart';

class Auth_Page extends StatelessWidget {
  Auth_Page({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //kalau dah login
            if (snapshot.hasData) {
              return const Main_Menu();
            } else {
              return Login_Screen();
            }
          }),
    );
  }
}
