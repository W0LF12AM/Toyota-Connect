import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/MainMenu_Screen.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_background_card.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_button.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_image_textfield2.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_textfield.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Body_Reparation_skrin extends StatefulWidget {
  const Body_Reparation_skrin({super.key});

  @override
  State<Body_Reparation_skrin> createState() => _Body_Reparation_skrinState();
}

class _Body_Reparation_skrinState extends State<Body_Reparation_skrin> {
  final Nama = TextEditingController();
  final Model = TextEditingController();
  final Tanggal = TextEditingController();
  final Plat_Nomor = TextEditingController();
  final Kondisi = TextEditingController();
  final Front = TextEditingController();
  final Back = TextEditingController();
  final Right = TextEditingController();
  final Left = TextEditingController();

  //Function section
  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  bool isFormValid() {
    return !isTextFieldEmpty(Nama) &&
        !isTextFieldEmpty(Model) &&
        !isTextFieldEmpty(Tanggal) &&
        !isTextFieldEmpty(Plat_Nomor) &&
        !isTextFieldEmpty(Kondisi) &&
        !isTextFieldEmpty(Front) &&
        !isTextFieldEmpty(Back) &&
        !isTextFieldEmpty(Right) &&
        !isTextFieldEmpty(Left);
  }

  Future<void> uploadDataToFirebaseStorage() async {
    try {
      // Lakukan upload gambar untuk setiap field yang membutuhkan
      if (Front.text.isNotEmpty) {
        await uploadImageToFirebaseStorage(Front);
      } else {
        // Tampilkan pesan kesalahan
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Pilih gambar depan terlebih dahulu.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      if (Back.text.isNotEmpty) {
        await uploadImageToFirebaseStorage(Back);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Pilih gambar belakang terlebih dahulu.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      if (Right.text.isNotEmpty) {
        await uploadImageToFirebaseStorage(Right);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Pilih gambar kanan terlebih dahulu.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      if (Left.text.isNotEmpty) {
        await uploadImageToFirebaseStorage(Left);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Pilih gambar kiri terlebih dahulu.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
      print('Data berhasil diupload dan disimpan di Firestore!');
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  bool isSubmitPressed = false;
  bool isFrontImagePicked = false;
  bool isBackImagePicked = false;
  bool isRightImagePicked = false;
  bool isLeftImagePicked = false;

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

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String format = "${now.day}/${now.month}/${now.year}";
    Tanggal.text = format;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainRed,
        child: Stack(children: [
          My_BgCard(),
          SingleChildScrollView(
            child: Column(
              children: [
                My_Appbar_Menu(
                    Title: 'Body Repairment',
                    Subtitle: 'Perbaikan Bodi Mobil',
                    IconTitle: Icons.car_repair),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        //Nama
                        My_Textfield(
                          controller: Nama,
                          HintText: 'Nama Pelanggan',
                          ObscureText: false,
                          readonly: false,
                          Errortext: isSubmitPressed && isTextFieldEmpty(Nama)
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

                        My_Textfield(
                          controller: Model,
                          HintText: 'Nama Model',
                          ObscureText: false,
                          readonly: false,
                          Errortext: isSubmitPressed && isTextFieldEmpty(Model)
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

                        My_Textfield(
                          controller: Tanggal,
                          HintText: 'Tanggal',
                          ObscureText: false,
                          readonly: true,
                          Errortext:
                              isSubmitPressed && isTextFieldEmpty(Tanggal)
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

                        My_Textfield(
                          controller: Plat_Nomor,
                          HintText: 'Plat  Nomor',
                          ObscureText: false,
                          readonly: false,
                          Errortext:
                              isSubmitPressed && isTextFieldEmpty(Plat_Nomor)
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

                        My_Textfield(
                          controller: Kondisi,
                          HintText: 'Kondisi',
                          ObscureText: false,
                          readonly: false,
                          Errortext:
                              isSubmitPressed && isTextFieldEmpty(Kondisi)
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

                        My_Image_textfield2(
                          controller: Front,
                          HintText: "Foto Mobil Bagian Depan",
                          ObscureText: false,
                          readonly: true,
                          onPressed: () {
                            uploadImageToFirebaseStorage(Front);
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        My_Image_textfield2(
                          controller: Back,
                          HintText: "Foto Mobil Bagian Belakang",
                          ObscureText: false,
                          readonly: true,
                          onPressed: () {
                            uploadImageToFirebaseStorage(Back);
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        My_Image_textfield2(
                          controller: Right,
                          HintText: "Foto Mobil Bagian Kanan",
                          ObscureText: false,
                          readonly: true,
                          onPressed: () {
                            uploadImageToFirebaseStorage(Right);
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        My_Image_textfield2(
                          controller: Left,
                          HintText: "Foto Mobil Bagian Kiri",
                          ObscureText: false,
                          readonly: true,
                          onPressed: () {
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
                                  setState(() {
                                    isSubmitPressed =
                                        true; // Set isSubmitPressed menjadi true
                                  });

                                  if (isFormValid()) {
                                    // Semua field terisi, lakukan upload ke Firebase Storage
                                    // Simpan data ke Firestore
                                    FirebaseFirestore.instance
                                        .collection('Body Repairment')
                                        .add({
                                      'Nama Pelanggan': Nama.text,
                                      'Model': Model.text,
                                      'Tanggal': Tanggal.text,
                                      'Plat Nomor': Plat_Nomor.text,
                                      'Kondisi': Kondisi.text,
                                      'Front': Front.text,
                                      'Back': Back.text,
                                      'Right': Right.text,
                                      'Left': Left.text,
                                      'Waktu': DateTime.now(),
                                    });

                                    Nama.clear;
                                    Model.clear;
                                    Plat_Nomor.clear;
                                    Kondisi.clear;
                                    Front.clear;
                                    Back.clear;
                                    Left.clear;
                                    Right.clear;

                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        title: 'SUBMITTED',
                                        text: 'Data anda sudah tersimpan!',
                                        onConfirmBtnTap: () {
                                          setState(() {
                                            isSubmitPressed = false;
                                          });
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              'Menu',
                                              (route) => false);
                                        });
                                  } else {
                                    // Ada field yang kosong, tampilkan pesan kesalahan atau lakukan sesuatu
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: 'ERROR',
                                      text:
                                          'Harap isi semua field sebelum submit!',
                                    );
                                  }
                                })
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
