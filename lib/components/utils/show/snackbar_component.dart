import 'package:flutter/material.dart';

class SnackBarComponent {
  static SnackBar execute({required String textMessage, required Color color}) {
    return SnackBar(content: Text(textMessage), backgroundColor: color);
  }
}
