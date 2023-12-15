// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_activity_log_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_background_card.dart';

class Activity_Menu_Log_Screen extends StatelessWidget {
  const Activity_Menu_Log_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainRed,
      child: Stack(children: [
        My_BgCard(),
        Column(children: [
          My_Appbar_Menu(
            Title: 'Activity Log Menu',
            Subtitle: 'Cek riwayat aktivitas terbaru',
            IconTitle: Icons.history,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              ALM_widget(
                SubtitleMenu: 'History Body Repairment',
                TitleMenu: 'Body repairment',
                ontap: () {
                  Navigator.pushNamed(context, 'LBody');
                },
              ),
              SizedBox(
                height: 10,
              ),
              ALM_widget(
                  SubtitleMenu: 'History Machine Check Up',
                  TitleMenu: 'Machine Check Up',
                  ontap: () {
                    Navigator.pushNamed(context, 'LMachine');
                  }),
              SizedBox(
                height: 10,
              ),
              ALM_widget(
                  SubtitleMenu: 'History Oil Changes',
                  TitleMenu: 'Oil Changes',
                  ontap: () {
                    Navigator.pushNamed(context, 'LOil');
                  })
            ],
          )
        ])
      ]),
    );
  }
}
