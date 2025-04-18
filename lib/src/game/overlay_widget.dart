import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game_flutter_rebuild/src/game/expression.dart';
import 'package:math_game_flutter_rebuild/src/providers/expression_provider.dart';
import 'package:provider/provider.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({super.key});
  

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}
 var total_color = Color.fromRGBO(255,0,0,0);

/*Expression create_expression(){
  var random = Random();
  List<String> operators = ['+', '-','*',"/"];
  int randomNumber1 = random.nextInt(11);
  int randomNumber2 = random.nextInt(11);
  int smallNum = max(randomNumber1, randomNumber2);
 int  bigNum = min(randomNumber1, randomNumber2);
  String randomOperator = operators.elementAt(random.nextInt(4));
  int total = 0;
  switch (randomOperator) {
    case "+":
      total = bigNum + smallNum;
      break;
    case "-":
      total = bigNum - smallNum;
      break;
    case "*":
      total = bigNum * smallNum;
      break;
    case "/":
    total = Expression;
    break;
    default:
  }

  String string_expression = "$bigNum, $randomOperator, $smallNum";
  print(string_expression);
  print(total);
  return Expression.create(number1: randomNumber1, number2: randomNumber2, operator: randomOperator);
}
*/

class _OverlayWidgetState extends State<OverlayWidget> {

  
  @override
    Widget build(BuildContext context) {
     var expressionProvider = Provider.of<ExpressionProvider>(context);
    var expression = expressionProvider.expression;
   

    return Text(expression.total.toString(), textAlign: TextAlign.center, style: GoogleFonts.poppins(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: total_color,
          ),);


  
   
  }
}

extension on Expression {
  get _string_expression => null;
}