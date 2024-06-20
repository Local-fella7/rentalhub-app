import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Alert {
  static void showAlert(BuildContext context, String title, String alertMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize:14 + 7,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
        content: Text(
          alertMessage,
          style: TextStyle(
            fontSize:14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.error
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
  static void showCopiedText(BuildContext context, String title, String copiedMessage) async{
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from closing by tapping outside
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize:14 + 7,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
        content: Text(
          copiedMessage,
          style: TextStyle(
            fontSize:14 + 7,
            letterSpacing: 3.0,
            // fontFamily: '',
            fontWeight: FontWeight.normal,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Copy',
              style: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            onPressed: () {
              _copyToClipboard(copiedMessage, context);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
  static void _copyToClipboard(String text, BuildContext context) {
    final data = ClipboardData(text: text);
    Clipboard.setData(data);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }
}