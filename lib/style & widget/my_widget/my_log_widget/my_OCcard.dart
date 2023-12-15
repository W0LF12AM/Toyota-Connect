import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class My_OCcard extends StatelessWidget {
  My_OCcard(
      {super.key,
      required this.Tanggal,
      required this.Nama_pelanggan,
      required this.Model,
      required this.Plat_nomor,
      required this.Username,
      required this.Kondisi});

  final String Tanggal;
  final String Nama_pelanggan;
  final String Model;
  final String Plat_nomor;
  final String Username;
  final String Kondisi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 160,
        width: 370,
        decoration: BoxDecoration(
            color: Color(0xFF282830),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.075),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(2, 2))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Nama_pelanggan,
                    style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(Tanggal,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                Plat_nomor + ' - ' + Model,
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                Kondisi,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                Username,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
