import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_log_appbar_menu.dart';
import 'package:mk_tutorial/style%20&%20widget/my_widget/my_log_background_card.dart';

class Activity_Log_Detail_Screen extends StatelessWidget {
  const Activity_Log_Detail_Screen({super.key});

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
              child: Column(children: [
                My_LAppbar_Menu(
                    Title: 'Log Detail',
                    Subtitle: 'Detail Log yang sudah di input',
                    IconTitle: Icons.remove_red_eye)
              ]),
            )
          ],
        ),
      ),
    );
  }
}
