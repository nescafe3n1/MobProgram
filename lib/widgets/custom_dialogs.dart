import 'package:flutter/material.dart';
import '../constants.dart'; // Import to use FB_DARK_PRIMARY

void customDialog(BuildContext context, {required String title, required String content}) {
  // Define the AlertDialog [cite: 269]
  AlertDialog alertDialog = AlertDialog(
    title: Text(title), // [cite: 270]
    content: Text(content), // [cite: 271]
    actions: [
      ElevatedButton(
        // Styled to match the dark teal theme [cite: 276, 277]
        style: ElevatedButton.styleFrom(
          backgroundColor: FB_DARK_PRIMARY, 
          foregroundColor: Colors.white,
        ),
        // Closes the dialog when pressed [cite: 278, 279]
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Okay"), // [cite: 274]
      ),
    ],
  );

  // Show the dialog in the current context [cite: 280-283]
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}