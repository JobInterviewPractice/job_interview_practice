abstract class StartState {}

class LoadingStartState extends StartState {}

class LoadedStartState extends StartState {
  LoadedStartState(
      {this.nowQuestion,
      this.numberOfAnsweringQuestions,
      this.numberOfTotalQuestions});

  String nowQuestion;
  int numberOfAnsweringQuestions;
  int numberOfTotalQuestions;
}
