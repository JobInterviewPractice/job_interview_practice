

class Question {
  int id;
  int numberOfQuestions;
  String questionText;
  bool isWeek;

  Question(String t) {
    questionText = t;
    // todo: numberofquestionをsettings pageから引っ張ってくる。
  }
}

class QuizBrain {

  int _questionID = 0;

  // counter
  int _answeredQuestion = 0;
  // todo: change List to Map to be able to find question by `Question.id`
  List<Question> questions = [
    // todo: bring from Data Store
    Question('Some cats are actually allergic to humans'),
    Question('You can lead a cow down stairs but not up stairs.'),
  ];

  void nextQuestion() {
  }

  String getQuestionText() {
    return questions[_questionID].questionText;
  }

  bool getIsWeek() {
  }
}

