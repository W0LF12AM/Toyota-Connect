import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';

class My_Bottom_Navbar extends StatelessWidget {
  const My_Bottom_Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        tabBackgroundColor: DarkBlue,
        iconSize: 20,
        activeColor: Colors.white,
        rippleColor: MainRed,
        gap: 6,
        tabs: [
          GButton(
            icon: Icons.headset_mic,
            text: 'Chat Bot',
          ),
          GButton(
            icon: Icons.home_filled,
            text: 'Home',
          ),
          GButton(
            icon: Icons.document_scanner_rounded,
            text: 'Log',
          ),
          GButton(
            icon: Icons.person_3,
            text: 'Profile',
          )
        ]);
  }
}
