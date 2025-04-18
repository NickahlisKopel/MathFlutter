import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game_flutter_rebuild/src/game/expression.dart';
import 'package:math_game_flutter_rebuild/src/game/expression_widget.dart';
import 'package:math_game_flutter_rebuild/src/game/overlay_widget.dart';

import 'package:math_game_flutter_rebuild/src/profile/user.dart';

import 'package:math_game_flutter_rebuild/src/providers/expression_provider.dart';


import 'package:math_game_flutter_rebuild/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:keyboard_numbers/keyboard_numbers.dart';
import 'package:math_game_flutter_rebuild/src/keyboard/keyboard_controller.dart';




class GameWidget extends StatefulWidget {
  const GameWidget({super.key});
  

  @override
  State<GameWidget> createState() => _GameWidgetState();
}
  var textColor = Colors.white;


  

bool Check(Expression expression, User user, KeyboardController keyboardController) {
 TextEditingController userInput = keyboardController; // Ensure it's nullable
 var random = Random();
 List<String> operators = ['+', '-','*',"/"];



  if (userInput.text.isEmpty) {
    print("User input is null");
    return false;
  }

  print("User input: $userInput, Expected: ${expression.total}");

  if (userInput.text.toString() == expression.total.toString()) {
    textColor = Colors.green;
    user.incrementCorrect();
    Future.delayed(Duration(seconds: 1), ()=>{textColor = Colors.white});
    Expression.create(number1:random.nextInt(10)  , number2: random.nextInt(10), operator: operators[random.nextInt(3)]);
   
    return true;
  } else {
    textColor = Colors.red;
    total_color = Color.fromRGBO(255, 0, 0, 1);
    user.incrementWrong();
   
    Future.delayed(Duration(seconds: 1), ()=>{textColor = Colors.white, total_color = Color.fromRGBO(0, 0, 0, 0)});
   
     Expression.create(number1:random.nextInt(10)  , number2: random.nextInt(10), operator: operators[random.nextInt(3)]);
    return false;
  }
 
}


class _GameWidgetState extends State<GameWidget> {
  @override
Widget build(BuildContext context) {
  var keyboardController = Provider.of<KeyboardController>(context);
  var userProvider = Provider.of<UserProvider>(context);
  var expressionProvider = Provider.of<ExpressionProvider>(context);

  // Ensure expression and user are not null
  var expression = expressionProvider.expression;
  var expression_string = expression.string_expression;
  var user = userProvider.user;



  if (user == null) {
    return Center(child: CircularProgressIndicator()); // Show a loading indicator until data is ready
  }

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: .01,
      children: [
       SizedBox(height: 70),
        Text(' Correct: ${user.sessionCorrect} Wrong: ${user.sessionWrong}', style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),),
        ExpressionWidget(),
         Text(' ${expression.total}', style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: total_color,
          ),),
        Text(keyboardController.text, style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),),
        keyboardNumbers(controller: keyboardController, fontSize: 40, borderSize: 10,),
       ElevatedButton(
        style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent, // Button color
    foregroundColor: Colors.white, // Text color
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 6), // Padding
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 5, // Shadow effect
  ),
       
  onPressed: () {
    Check(expression, user, keyboardController);
   
    print('${expression}, ${expression_string}');
    Provider.of<ExpressionProvider>(context, listen: false).generate();
    keyboardController.text = "";// Generates new expression
  },
  child: Text("Next Equation",style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),), 
)
,
      ],
    ),
  );
}

}
extension on OverlayWidget {
  get total_color => null;
}

