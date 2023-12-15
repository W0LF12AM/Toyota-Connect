import 'package:flutter/material.dart';
import 'package:mk_tutorial/style%20&%20widget/text_style/text_style.dart';

class My_Menu extends StatelessWidget {
  const My_Menu(
      {super.key,
      required this.Menutitle,
      required this.SubMenuTitle,
      required this.ImageMenu,
      required this.ikon,
      required this.onPressed});

  final String Menutitle;
  final String SubMenuTitle;
  final String ImageMenu;
  final IconData? ikon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 210,
          width: 370,
          child: Image.asset(
            ImageMenu,
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.075), // Warna shadow
                  spreadRadius: 5, // Radius penyebaran shadow
                  blurRadius: 5, // Radius blur shadow
                  offset: Offset(0, 3),
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Container(
            width: 371,
            height: 71,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(Menutitle, style: MainMenuStyle),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(SubMenuTitle, style: SubMenuTitleStyle),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 300, top: 120),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.075), // Warna shadow
                      spreadRadius: 3, // Radius penyebaran shadow
                      blurRadius: 5, // Radius blur shadow
                      offset: Offset(0, 3))
                ]),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(ikon),
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
