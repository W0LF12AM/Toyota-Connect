import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/MainMenu_Screen.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_background_card.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_button.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_textfield.dart';
import 'package:quickalert/quickalert.dart';

class Oil_Changes_Screen extends StatefulWidget {
  Oil_Changes_Screen({super.key});

  @override
  State<Oil_Changes_Screen> createState() => _Oil_Changes_ScreenState();
}

class _Oil_Changes_ScreenState extends State<Oil_Changes_Screen> {
  final Nama = TextEditingController();

  final Model = TextEditingController();

  final Tanggal = TextEditingController();

  final Plat_Nomor = TextEditingController();

  final Kilometer = TextEditingController();

  //format tanggal
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String format = "${now.day}/${now.month}/${now.year}";
    Tanggal.text = format;
  }

  bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  bool isSubmitPressed = false;

  bool validateFields() {
    if (isSubmitPressed) {
      return !isTextFieldEmpty(Nama) &&
          !isTextFieldEmpty(Model) &&
          !isTextFieldEmpty(Plat_Nomor) &&
          !isTextFieldEmpty(Tanggal) &&
          !isTextFieldEmpty(Kilometer);
    }
    return true;
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
                  Title: 'Oil Changes',
                  Subtitle: 'Ganti oli mobil',
                  IconTitle: Icons.car_repair,
                ),

                SizedBox(
                  height: 20,
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

                      //Input Model Kendaraan
                      My_Textfield(
                        readonly: false,
                        controller: Model,
                        HintText: 'Nama Model',
                        ObscureText: false,
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

                      //Input Plat Nomor
                      My_Textfield(
                        readonly: false,
                        controller: Plat_Nomor,
                        HintText: 'Plat Nomor',
                        ObscureText: false,
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
                      //Input tanggal
                      My_Textfield(
                        readonly: true,
                        controller: Tanggal,
                        HintText: 'Tanggal',
                        ObscureText: false,
                        Errortext: isSubmitPressed && isTextFieldEmpty(Tanggal)
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

                      //Input Kilometer
                      My_Textfield(
                        readonly: false,
                        controller: Kilometer,
                        HintText: 'Km',
                        ObscureText: false,
                        Errortext:
                            isSubmitPressed && isTextFieldEmpty(Kilometer)
                                ? 'Field ini harus diisi'
                                : null,
                        Onchanged: (value) {
                          bool isNotEmpty = value.isNotEmpty;

                          if (isNotEmpty) {
                            setState(() {
                              Kilometer.text = value;
                            });
                          } else {
                            setState(() {
                              Kilometer.text = '';
                            });
                          }
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
                                  isSubmitPressed = true;
                                });

                                if (validateFields()) {
                                  CollectionReference koleksi =
                                      FirebaseFirestore.instance
                                          .collection('Oil Changes');
                                  koleksi.add({
                                    'Nama Pelanggan': Nama.text,
                                    'Model': Model.text,
                                    'Plat Nomor': Plat_Nomor.text,
                                    'Tanggal': Tanggal.text,
                                    'Kilometer': Kilometer.text,
                                    'Waktu': DateTime.now(),
                                  });

                                  Nama.clear();
                                  Model.clear();
                                  Plat_Nomor.clear();
                                  Kilometer.clear();

                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    title: 'SUBMITED',
                                    text: 'Data anda sudah tersimpan!',
                                    onConfirmBtnTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, 'Menu', (route) => false);
                                    },
                                  );
                                  setState(() {
                                    isSubmitPressed = false;
                                  });
                                } else {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'ERROR',
                                    text:
                                        'Gagal menyimpan data. Silakan coba lagi.',
                                  );
                                }
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
