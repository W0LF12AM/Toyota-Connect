import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class My_Card extends StatefulWidget {
  My_Card({
    Key? key,
    required this.documentID,
    required this.Tanggal,
    required this.Nama_pelanggan,
    required this.Model,
    required this.Plat_nomor,
    required this.Username,
  }) : super(key: key);

  final String documentID;
  final String Tanggal;
  final String Nama_pelanggan;
  final String Model;
  final String Plat_nomor;
  final String Username;

  @override
  State<My_Card> createState() => _My_CardState();
}

class _My_CardState extends State<My_Card> {
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _isDeleting ? 0 : 167,
          width: 370,
          decoration: BoxDecoration(
            color: Color(0xFF282830),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.075),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(2, 2),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: _isDeleting
              ? null
              : Padding(
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
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.Tanggal,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.Plat_nomor,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.Model,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.Username,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> deleteData(String documentID) async {
    try {
      await FirebaseFirestore.instance
          .collection('Machine Check Up')
          .doc(documentID)
          .delete();
      setState(() {});
    } catch (error) {
      print('Error : $error');
      setState(() {
        _isDeleting = false; // Reset deletion state if deletion fails
      });
      throw error;
    }
  }
}
