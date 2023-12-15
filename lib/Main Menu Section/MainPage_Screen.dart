// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/Body_Reparation_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/Machine_Chekcup_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/Oil_Chnages_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/body_Reparation_fix_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/fixing_body_Reparation.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_appbar.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_background_card.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_menu.dart';

class MainMenu_Screen extends StatelessWidget {
  MainMenu_Screen({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetail() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: getUserDetail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error : ${snapshot.error}'));
        } else if (snapshot.hasData) {
          Map<String, dynamic>? user = snapshot.data!.data();
          return Container(
            color: MainRed,
            child: Stack(
              children: [
                My_BgCard(),
                ListView(
                  children: [
                    Column(
                      children: [
                        My_AppBar(
                          Title: 'Hi, ' + user!["username"],
                          Subtitle: 'Hope you have a great day!',
                          IconTitle: Icons.person,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        My_Menu(
                            Menutitle: 'Body Repair',
                            SubMenuTitle: 'Perbaikan body kit mobil',
                            ImageMenu: 'assets/Body.jpg',
                            ikon: Icons.add,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Body_Reparation_skrin()));
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        My_Menu(
                            Menutitle: 'Machine Check Up',
                            SubMenuTitle: 'Check Up your machine routine',
                            ImageMenu: 'assets/Machine Check.jpg',
                            ikon: Icons.add,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Machine_Checkup_Screen()));
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        My_Menu(
                            Menutitle: 'Oil Changes',
                            SubMenuTitle: 'Ganti Oli anda secara rutin',
                            ImageMenu: 'assets/Oil Changes.jpg',
                            ikon: Icons.add,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Oil_Changes_Screen()));
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Text('user not found');
        }
      },
    );
  }
}
