// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    _GoToLogin();
  }

  _GoToLogin() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacementNamed(context, 'Auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight, colors: [MainRedDarker, MainRed]),
        ),

        //Logo Toyota beserta text
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Toyota.png',
                height: 154,
                width: 154,
              ),
              Text(
                'TOYOTA',
                style: TitleStyle,
              ),
              Text(
                'Start Your Impossible',
                style: SubTitleStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
