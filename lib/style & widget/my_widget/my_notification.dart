import 'package:flutter/material.dart';

void allertmessage(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(message),
          ));
}
