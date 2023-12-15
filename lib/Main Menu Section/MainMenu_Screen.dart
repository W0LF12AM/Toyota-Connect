// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:mk_tutorial/Activity%20Log%20Section/Acitivity_Log_menu_Screen.dart';
import 'package:mk_tutorial/Chat%20Bot%20Section/Chat_Bot_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/MainPage_Screen.dart';
import 'package:mk_tutorial/Profile%20Section/Profile_screen.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class Main_Menu extends StatefulWidget {
  const Main_Menu({super.key});

  @override
  State<Main_Menu> createState() => _Main_MenuState();
}

class _Main_MenuState extends State<Main_Menu> {
  int index = 1;
  final List Screens = [
    Chat_Bot_Screen(),
    MainMenu_Screen(),
    Activity_Menu_Log_Screen(),
    Profile_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStatePropertyAll(SubGreetingStyle),
            height: 60,
            indicatorColor: DarkBlue,
          ),
          child: NavigationBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              animationDuration: Duration(milliseconds: 1000),
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationDestination(
                    selectedIcon: Icon(
                      Icons.headset_mic,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.headset_mic,
                    ),
                    label: 'Chat Bot'),
                NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    icon: Icon(Icons.home_filled),
                    label: 'Home'),
                NavigationDestination(
                    selectedIcon: Icon(
                      Icons.document_scanner,
                      color: Colors.white,
                    ),
                    icon: Icon(Icons.document_scanner),
                    label: 'Log Activity'),
                // NavigationDestination(
                //     selectedIcon: Icon(
                //       Icons.person_3,
                //       color: Colors.white,
                //     ),
                //     icon: Icon(Icons.person_3),
                //     label: 'Profile'),
              ]),
        ));
  }
}
