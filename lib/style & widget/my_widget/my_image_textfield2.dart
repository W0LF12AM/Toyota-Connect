// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class My_Image_textfield2 extends StatefulWidget {
  const My_Image_textfield2(
      {super.key,
      required this.controller,
      required this.HintText,
      required this.ObscureText,
      required this.readonly,
      required this.onPressed});

  final controller;
  final String HintText;
  final bool ObscureText;
  final bool readonly;
  final VoidCallback onPressed;

  @override
  State<My_Image_textfield2> createState() => _My_Image_textfieldState();
}

class _My_Image_textfieldState extends State<My_Image_textfield2> {
  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      final imageFile = File(PickedFile.path);
      widget.controller.text = imageFile.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TextField(
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
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 0),
            child: IconButton(
                onPressed: widget.onPressed, icon: Icon(Icons.photo)),
          )),
    ));
  }
}
