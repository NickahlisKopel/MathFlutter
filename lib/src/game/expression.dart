import 'dart:math';

class Expression {
  late int number1;
  late int number2;
  late String operator;
  late int total;
  late String _string_expression;

  // Constructor without `total`, it is calculated internally
  Expression.create({required this.number1, required this.number2, required this.operator}) {
    total = _calculateTotal(number1, number2, operator);
    _string_expression = "$number1 $operator $number2";
  }

  

  String get string_expression => _string_expression;

  // Function to calculate the total based on the operator
  int _calculateTotal(int num1, int num2, String op) {
    
  int bigNum = max(num1, num2);

  int smallNum = (bigNum == num1) ? num2 : num1;
  _string_expression = "$bigNum $operator $smallNum";
    switch (op) {
      case "+":
        return num1 + num2;
      case "-":
        return bigNum - smallNum;
      case "*":
        return num1 * num2;
      case "/":
        return (num2 != 0 && num1 != 0) ? (bigNum ~/ smallNum) : 0; // Integer division
      default:
        return 0;
    }
  }

  // Function to generate a new expression
  static Expression create_expression() {
    var random = Random();
    List<String> operators = ['+', '-', '*', '/'];
    int num1 = random.nextInt(11);
    int num2 = random.nextInt(11);
    String op = operators[random.nextInt(4)];

    return Expression.create(number1: num1, number2: num2, operator: op);
  }
}
