// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

class My_Textfield extends StatefulWidget {
  My_Textfield(
      {super.key,
      required this.controller,
      required this.HintText,
      required this.ObscureText,
      required this.readonly,
      required this.Errortext,
      required this.Onchanged});

  final controller;
  final String HintText;
  final bool ObscureText;
  final bool readonly;
  String? Errortext;
  final Function(String)? Onchanged;

  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  @override
  State<My_Textfield> createState() => _My_TextfieldState();
}

class _My_TextfieldState extends State<My_Textfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.ObscureText,
        readOnly: widget.readonly,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9D9D9))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9D9D9))),
          filled: true,
          fillColor: Color(0xffD9D9D9),
          hintText: widget.HintText,
          hintStyle: TextStyle(color: Color(0xff909090)),
          errorText: widget.Errortext,
        ),
        onChanged: widget.Onchanged);
  }
}
