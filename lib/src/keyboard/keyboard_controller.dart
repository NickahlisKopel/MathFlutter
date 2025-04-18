import 'package:flutter/material.dart';

class KeyboardController extends  TextEditingController  {
  final TextEditingController textController = TextEditingController();

  String get input => textController.text; // Get input directly from TextEditingController

  void addDigit(String digit) {
    textController.text += digit;
    textController.selection = TextSelection.fromPosition( // Moves cursor to end
      TextPosition(offset: textController.text.length),
    );
    notifyListeners(); // Notify UI to update
  }

  void removeLast() {
    if (textController.text.isNotEmpty) {
      textController.text = textController.text.substring(0, textController.text.length - 1);
      textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
      notifyListeners();
    }
  }

  void clear() {
    textController.clear();
    notifyListeners();
  }
}
