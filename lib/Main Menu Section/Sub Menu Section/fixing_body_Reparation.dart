// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/MainMenu_Screen.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_background_card.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_button.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_image_textfield.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_textfield.dart';
import 'package:quickalert/quickalert.dart';

class Fixing_body_repairation extends StatefulWidget {
  Fixing_body_repairation({super.key});

  @override
  State<Fixing_body_repairation> createState() =>
      _Fixing_body_repairationState();
}

class _Fixing_body_repairationState extends State<Fixing_body_repairation> {
  final Nama = TextEditingController();

  final Model = TextEditingController();

  final Tanggal = TextEditingController();

  final Plat_Nomor = TextEditingController();

  final Kondisi = TextEditingController();

  final Front = TextEditingController();

  final Back = TextEditingController();

  final Right = TextEditingController();

  final Left = TextEditingController();

  //veripikasi field yang kozooonk
  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  //FUNGSI UPLOAD
  Future<void> uploadImageToFirebaseStorage(
      TextEditingController controller) async {
    try {
      final storageReference = firebase_storage.FirebaseStorage.instance.ref();
      final picker = ImagePicker();

      // Pilih gambar dari galeri
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final imageFile = File(pickedFile.path);
        final imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

        // Unggah gambar ke Firebase Storage
        await storageReference
            .child('images/$imageFileName')
            .putFile(imageFile);

        // Dapatkan URL unduhan
        final downloadURL = await storageReference
            .child('images/$imageFileName')
            .getDownloadURL();

        // URL gambar di unduh ke controller
        controller.text = downloadURL;

        print('Gambar diunggah. URL Unduhan: $downloadURL');
      } else {
        print('Tidak ada gambar yang dipilih.');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //fungsi sambit
  Future<void> saveData() async {
    try {
      CollectionReference koleksi =
          FirebaseFirestore.instance.collection('Body Repairment');
      await koleksi.add({
        'Nama Pelanggan': Nama.text,
        'Model': Model.text,
        'Plat Nomor': Plat_Nomor.text,
        'Tanggal': Tanggal.text,
        'Kondisi': Kondisi.text,
        'Front': Front.text,
        'Back': Back.text,
        'Right': Right.text,
        'Left': Left.text,
        'Waktu': DateTime.now(),
      });

      // Reset nilai field setelah data disimpan
      Nama.clear();
      Model.clear();
      Plat_Nomor.clear();
      Tanggal.clear();
      Kondisi.clear();
      Front.clear();
      Back.clear();
      Right.clear();
      Left.clear();

      print('Data saved to Firestore');
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'SUBMITED',
        text: 'Data anda sudah tersimpan!',
        onConfirmBtnTap: () {
          Navigator.pushNamedAndRemoveUntil(context, 'Nama', (route) => false);
        },
      );
    } catch (error) {
      print('Error saving data: $error');
    }
  }

  //format tanggal
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String format = "${now.day}/${now.month}/${now.year}";
    Tanggal.text = format;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainRed,
        child: Stack(
          children: [
            My_BgCard(),
            SingleChildScrollView(
                child: Column(
              children: [
                //header halaman
                My_Appbar_Menu(
                  Title: 'Body Repairment',
                  Subtitle: 'Perbaikan Body Mobil',
                  IconTitle: Icons.car_repair,
                ),

                SizedBox(
                  height: 10,
                ),

                //Input Nama Pelanggan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      My_Textfield(
                        readonly: false,
                        controller: Nama,
                        HintText: 'Nama Pelanggan',
                        ObscureText: false,
                        Errortext: isTextFieldEmpty(Nama)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              Nama.text = value;
                            });
                          } else {
                            setState(() {
                              Nama.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Input Model Kendaraan
                      My_Textfield(
                        readonly: false,
                        controller: Model,
                        HintText: 'Nama Model',
                        ObscureText: false,
                        Errortext: isTextFieldEmpty(Model)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              Model.text = value;
                            });
                          } else {
                            setState(() {
                              Model.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Input Plat Nomor
                      My_Textfield(
                        readonly: false,
                        controller: Plat_Nomor,
                        HintText: 'Plat Nomor',
                        ObscureText: false,
                        Errortext: isTextFieldEmpty(Plat_Nomor)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              Plat_Nomor.text = value;
                            });
                          } else {
                            setState(() {
                              Plat_Nomor.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Input tanggal
                      My_Textfield(
                        readonly: true,
                        controller: Tanggal,
                        HintText: 'Tanggal',
                        ObscureText: false,
                        Errortext: isTextFieldEmpty(Tanggal)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              Tanggal.text = value;
                            });
                          } else {
                            setState(() {
                              Tanggal.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Butuh tidaknya dibawa kepusat (y/n)
                      My_Textfield(
                        readonly: false,
                        controller: Kondisi,
                        HintText: 'Kondisi',
                        ObscureText: false,
                        Errortext: isTextFieldEmpty(Kondisi)
                            ? 'Field ini harus diisi'
                            : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              Kondisi.text = value;
                            });
                          } else {
                            setState(() {
                              Kondisi.text = '';
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Pap Mobil depan
                      My_Image_textfield(
                        readonly: true,
                        controller: Front,
                        HintText: 'Foto mobil bagian depan',
                        ObscureText: false,
                        onpressed: () {
                          uploadImageToFirebaseStorage(Front);
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Pap Mobil belakang
                      My_Image_textfield(
                          readonly: true,
                          controller: Back,
                          HintText: 'Foto mobil bagian belakang',
                          ObscureText: false,
                          onpressed: () {
                            uploadImageToFirebaseStorage(Back);
                          }),

                      SizedBox(
                        height: 10,
                      ),
                      //Pap Mobil kanan
                      My_Image_textfield(
                        readonly: true,
                        controller: Right,
                        HintText: 'Foto mobil bagian kanan',
                        ObscureText: false,
                        onpressed: () {
                          uploadImageToFirebaseStorage(Right);
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Pap Mobil kiri
                      My_Image_textfield(
                        readonly: true,
                        controller: Left,
                        HintText: 'Foto mobil bagian kiri',
                        ObscureText: false,
                        onpressed: () {
                          uploadImageToFirebaseStorage(Left);
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          My_Button(
                              NamaTombol: 'Back',
                              onTap: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Main_Menu()));
                              }),
                          My_Button(
                              NamaTombol: 'Submit',
                              onTap: () {
                                saveData();
                              }),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
