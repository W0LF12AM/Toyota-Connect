import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class My_BRcard extends StatefulWidget {
  My_BRcard(
      {super.key,
      required this.Tanggal,
      required this.Nama_pelanggan,
      required this.Model,
      required this.Plat_nomor,
      required this.Username,
      required this.Kondisi,
      required this.documentID});

  final String documentID;
  final String Tanggal;
  final String Nama_pelanggan;
  final String Model;
  final String Plat_nomor;
  final String Username;
  final String Kondisi;

  @override
  State<My_BRcard> createState() => _My_BRcardState();
}

class _My_BRcardState extends State<My_BRcard> {
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onDoubleTap: () {
          if (!_isDeleting) {
            setState(() {
              _isDeleting = true;
            });
            deleteData(widget.documentID);
          }
        },
        child: Container(
          height: 165,
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
                      widget.Nama_pelanggan,
                      style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    Text(widget.Tanggal,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.Plat_nomor + ' - ' + widget.Model,
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.Kondisi,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.Username,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future deleteData(String documentID) async {
    try {
      await FirebaseFirestore.instance
          .collection('Body Repairment')
          .doc(documentID)
          .delete();
      print('Delete sucsess');
    } catch (error) {
      print('Error: $error');
      setState(() {
        _isDeleting = false; // Reset deletion state if deletion fails
      });
      throw error;
    }
  }
}
