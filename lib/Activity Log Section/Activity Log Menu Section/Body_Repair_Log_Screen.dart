import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_log_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_log_background_card.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_log_widget/my_BRcard.dart';

class Body_repairment_log_screen extends StatelessWidget {
  Body_repairment_log_screen({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainRed,
        elevation: 0,
      ),
      body: Container(
        color: MainRed,
        child: Stack(
          children: [
            My_LBgCard(),
            SingleChildScrollView(
              child: Column(
                children: [
                  My_LAppbar_Menu(
                      Title: 'Body Repair Log Activity',
                      Subtitle: 'Riwayat aktivitas',
                      IconTitle: Icons.history),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('Body Repairment')
                          .orderBy('Waktu', descending: true)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Text('No data available');
                        } else {
                          return Column(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;

                              return FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(currentUser!.email)
                                      .get(),
                                  builder: (context, userSnapshot) {
                                    if (userSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (userSnapshot.hasError) {
                                      return Text(
                                          'Error: ${userSnapshot.error}');
                                    } else if (!userSnapshot.hasData) {
                                      return Text('No user data available');
                                    } else {
                                      Map<String, dynamic> userData =
                                          userSnapshot.data!.data()
                                              as Map<String, dynamic>;

                                      return Column(
                                        children: [
                                          My_BRcard(
                                            Nama_pelanggan:
                                                data['Nama Pelanggan'],
                                            Tanggal: data['Tanggal'],
                                            Plat_nomor: data['Plat Nomor'],
                                            Model: data['Model'],
                                            Kondisi: data['Kondisi'],
                                            Username: userData['username'],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      );
                                    }
                                  });
                            }).toList(),
                          );
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
