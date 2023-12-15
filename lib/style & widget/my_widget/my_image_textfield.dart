// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class My_Image_textfield extends StatefulWidget {
  const My_Image_textfield({
    super.key,
    required this.controller,
    required this.HintText,
    required this.ObscureText,
    required this.readonly,
    required this.onpressed,
  });

  final controller;
  final String HintText;
  final bool ObscureText;
  final bool readonly;
  final Function()? onpressed;

  @override
  State<My_Image_textfield> createState() => _My_Image_textfieldState();
}

class _My_Image_textfieldState extends State<My_Image_textfield> {
  //path gambarrrrrr
  late String? imagePath;

  //fungsi ambil gambar dari galeri
  Future<void> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
        widget.controller.text = imagePath;
      });
    }
  }

  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onpressed,
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
              suffixIcon: IconButton(
                  onPressed: widget.onpressed, icon: Icon(Icons.image)),
              errorText:
                  imagePath == null ? 'Pilih gambar terlebih dahulu' : null),
        ));
  }
}
