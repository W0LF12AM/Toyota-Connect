// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class My_AppBar extends StatelessWidget {
  My_AppBar(
      {super.key,
      required this.Title,
      required this.Subtitle,
      required this.IconTitle});

  final String Title;
  final String Subtitle;
  final IconData? IconTitle;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: 73,
          width: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.075), // Warna shadow
                spreadRadius: 5, // Radius penyebaran shadow
                blurRadius: 5, // Radius blur shadow
                offset:
                    Offset(0, 3), // Posisi offset shadow (horizontal, vertical)
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  IconTitle,
                  size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Title, style: MainMenuStyle),
                    Text(
                      Subtitle,
                      style: SubGreetingStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 70,
              ),
              IconButton(onPressed: SignOut, icon: Icon(Icons.exit_to_app))
            ],
          ),
        ),
      ),
    );
  }
}
