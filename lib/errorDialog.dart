import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Something went wrong!'),
    );
  }
}