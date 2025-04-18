import 'package:flutter/material.dart';
import 'package:math_game_flutter_rebuild/src/app.dart';
import 'package:math_game_flutter_rebuild/src/game/expression.dart';
import 'package:math_game_flutter_rebuild/src/game/game_widget.dart';
import 'package:math_game_flutter_rebuild/src/profile/user_widget.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  double _opacity = 0.0;

  // List of tutorial equations
  final List<Expression> tutorialExpressions = [
    Expression.create(number1: 2, number2: 3, operator: "+"),
    Expression.create(number1: 5, number2: 2, operator: "-"),
    Expression.create(number1: 4, number2: 3, operator: "*"),
    Expression.create(number1: 4, number2: 7, operator: "/"),
  ];

  @override
  void initState() {
    super.initState();
    _animateText(); // Trigger fade-in animation
  }

  void _animateText() {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0; // Fade in the text
      });
    });
  }

  void _nextPage() {
    if (_currentIndex < tutorialExpressions.length - 1) {
      setState(() {
        _opacity = 0.0; // Fade out text
      });

      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _currentIndex++;
          _animateText(); // Fade in new text
        });
      });
    } else {
      // Navigate to the main game
     Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const HomePage(),
    ),
  );
    }
  }

  @override
  Widget build(BuildContext context) {
    final expression = tutorialExpressions[_currentIndex];

    return Scaffold(

      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Learn Basic Math",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 30),

            // Animated Text (Equation)
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _opacity,
              child: Text(
                expression.string_expression,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // Animated Text (Explanation)
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _opacity,
              child: Text(
                _getOperatorExplanation(expression.operator),
                style: TextStyle(fontSize: 20, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),

            // Next Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[700],
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _nextPage, // Go to next step
              child: Text(_currentIndex < tutorialExpressions.length - 1 ? "Next" : "Start Game"),
            ),
          ],
        ),
      ),
    );
  }

  String _getOperatorExplanation(String operator) {
    switch (operator) {
      case "+":
        return "Addition: Combining two numbers together.";
      case "-":
        return "Subtraction: Finding the difference between two numbers.";
      case "*":
        return "Multiplication: Adding a number multiple times.";
      case "/":
        return "Division: Splitting a number into equal parts.\n\nround down to the whole number.\nin this equation, \neven though the fraction is above half, \n4 can only fit into 7, once.";
      default:
        return "";
    }
  }
}
