// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mk_tutorial/Activity%20Log%20Section/Activity%20Log%20Menu%20Section/Body_Repair_Log_Screen.dart';
import 'package:mk_tutorial/Activity%20Log%20Section/Activity%20Log%20Menu%20Section/Machine_Check_Up_Log_Screen.dart';
import 'package:mk_tutorial/Activity%20Log%20Section/Activity%20Log%20Menu%20Section/Oil_changes_Log_Screen.dart';
import 'package:mk_tutorial/Auth%20Section/Auth_page.dart';
import 'package:mk_tutorial/Auth%20Section/Login_Screen.dart';
import 'package:mk_tutorial/Auth%20Section/Register_Screen.dart';
import 'package:mk_tutorial/Auth%20Section/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/MainMenu_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/Body_Reparation_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/Machine_Chekcup_Screen.dart';
import 'package:mk_tutorial/Main%20Menu%20Section/Sub%20Menu%20Section/Oil_Chnages_Screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Toyota());
}

class Toyota extends StatelessWidget {
  const Toyota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Toyota App",
      initialRoute: 'Splash',
      routes: {
        'Splash': (context) => Splash_Screen(),
        'Auth': (context) => Auth_Page(),
        'Login': (context) => Login_Screen(),
        'Register': (context) => Register_Screen(),
        'Menu': (context) => Main_Menu(),
        'Body': (context) => Body_Repair_Screen(),
        'Oil': (context) => Oil_Changes_Screen(),
        'Machine': (context) => Machine_Checkup_Screen(),
        'LBody': (context) => Body_repairment_log_screen(),
        'LMachine': (context) => Machine_check_up_Log_Screen(),
        'LOil': (context) => Oil_changes_Log_Screen()
      },
    );
  }
}
