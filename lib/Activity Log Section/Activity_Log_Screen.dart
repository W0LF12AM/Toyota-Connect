// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_background_card.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_log_widget/my_card.dart';

class Activity_Log_Screen extends StatelessWidget {
  const Activity_Log_Screen({super.key});

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
                  My_Appbar_Menu(
                      Title: 'Log Activity',
                      Subtitle: 'Riwayat aktivitas',
                      IconTitle: Icons.history),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                    Tanggal: 'DD/MM/YYY',
                    Nama_pelanggan: 'Pelanggan',
                    Model: 'Camry',
                    Plat_nomor: 'F 1234 RE',
                    Username: 'Bayu',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                      Tanggal: 'DD/MM/YYY',
                      Nama_pelanggan: 'Pelanggan',
                      Model: 'Camry',
                      Plat_nomor: 'F 1234 RE',
                      Username: 'Bayu'),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                      Tanggal: 'DD/MM/YYY',
                      Nama_pelanggan: 'Pelanggan',
                      Model: 'Camry',
                      Plat_nomor: 'F 1234 RE',
                      Username: 'Bayu'),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                      Tanggal: 'DD/MM/YYY',
                      Nama_pelanggan: 'Pelanggan',
                      Model: 'Camry',
                      Plat_nomor: 'F 1234 RE',
                      Username: 'Bayu'),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                      Tanggal: 'DD/MM/YYY',
                      Nama_pelanggan: 'Pelanggan',
                      Model: 'Camry',
                      Plat_nomor: 'F 1234 RE',
                      Username: 'Bayu'),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                      Tanggal: 'DD/MM/YYY',
                      Nama_pelanggan: 'Pelanggan',
                      Model: 'Camry',
                      Plat_nomor: 'F 1234 RE',
                      Username: 'Bayu'),
                  SizedBox(
                    height: 15,
                  ),
                  My_Card(
                      Tanggal: 'DD/MM/YYY',
                      Nama_pelanggan: 'Pelanggan',
                      Model: 'Camry',
                      Plat_nomor: 'F 1234 RE',
                      Username: 'Bayu'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
