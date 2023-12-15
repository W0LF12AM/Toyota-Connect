import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/color_style/color_style.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class ALM_widget extends StatelessWidget {
  const ALM_widget(
      {super.key,
      required this.SubtitleMenu,
      required this.TitleMenu,
      required this.ontap});

  final String TitleMenu;
  final String SubtitleMenu;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 73,
        width: 370,
        decoration: BoxDecoration(
          color: DarkBlue,
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
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
          child: Column(children: [
            Row(
              children: [
                Text(
                  TitleMenu,
                  style: MainMenuStyle2,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  SubtitleMenu,
                  style: SubMenuTitleStyle2,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
