import 'package:flutter/material.dart';
import '../constants.dart';

void customDialog(BuildContext context, {required String title, required String content}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: FB_DARK_PRIMARY,
          foregroundColor: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
        child: const Text("Okay"),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) => alertDialog,
  );
}