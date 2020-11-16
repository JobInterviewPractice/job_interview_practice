import 'dart:math';

class Question {
  int id;
  String questionText;
  bool isWeek;

  Question(String t) {
    questionText = t;
  }
}

class QuizBrain {


  int numberOfQuestions = 5; // todo: numberofquestionをsettings pageから引っ張ってくる。

  int _questionID = 0;

  // counter
  int answeredQuestion = 0;

  // todo: change List to Map to be able to find question by `Question.id`
  List<Question> questions = [
    // todo: bring from Data Store
    Question('Some cats are actually allergic to humans'),
    Question('You can lead a cow down stairs but not up stairs.'),
    Question('test'),
    Question('You can lead a cow down'),
  ];


  void nextQuestion() {
    answeredQuestion++;
    _questionID = Random().nextInt(3) + 1;
    print('nextquestion called,\n'
        '_answeredQuestion: $answeredQuestion\n'
        '_questionID: $_questionID');
  }

  String getQuestionText() {
    return questions[_questionID].questionText;
  }

  bool getIsWeek() {
  }

  // isFinish returns whether question
  bool isFinished() {
    if(answeredQuestion == numberOfQuestions+1)
      return true;
    else
      return false;
  }
}

