import 'package:flutter/material.dart';
import 'dart:math';
import 'package:math_game_flutter_rebuild/src/game/expression.dart';

class ExpressionProvider extends ChangeNotifier {
  late Expression _expression;

  ExpressionProvider() {
    _expression = Expression.create_expression(); // Properly initialize the expression
  }

  Expression get expression => _expression;

  // Corrected function to generate a new expression
  void generate() {
    _expression = Expression.create_expression(); // Create a new expression
    notifyListeners();  // Notify the UI to update
    print("New expression generated: ${_expression.string_expression}");
  }
}
