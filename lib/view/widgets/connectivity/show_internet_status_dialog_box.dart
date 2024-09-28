import 'package:flutter/material.dart';

void showInternetStatusDialogBox(BuildContext context, VoidCallback onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("No Internet Connection"),
        content: const Text(
            "It looks like you're not connected to the internet. Please check your connection to continue using the app."),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: const Text("Got it"),
          ),
        ],
      );
    },
  );
}
