// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class My_Button extends StatelessWidget {
  My_Button({super.key, required this.NamaTombol, required this.onTap});

  final String NamaTombol;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text(NamaTombol, style: SignInUp),
        ),
      ),
    );
  }
}
