

class User {
  final String id;
  final String name;
  final String ?email;
  int sessionCorrect = 0;
  int totalCorrect = 0;
  int sessionWrong = 0;
  int totalWrong = 0;


  User({required this.id, required this.name, this.email});
  User.register({required this.id, required this.name, required this.email});

  

  void incrementCorrect(){
    sessionCorrect++;
    totalCorrect++;
  }

  void incrementWrong() {
    sessionWrong++;
    totalWrong++;
  }

  void resetSession() {
    sessionCorrect = 0;
    sessionWrong = 0;
  }

  void resetAllStats() {
    sessionCorrect = 0;
    totalCorrect = 0;
    sessionWrong = 0;
    totalWrong = 0;
  }
}


