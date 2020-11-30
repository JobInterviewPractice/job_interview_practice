import 'package:job_interview_practice/core/local_storage/local_storage.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/data/models/number_of_questions_model.dart';
import 'package:job_interview_practice/feature/setting/data/models/only_week_question_model.dart';

abstract class SettingsDataSource {
  Future<NumberOfQuestionModel> getNumberOfQuestions();
  Future<OnlyWeekQuestionModel> getOnlyWeekQuestion();
  Future<NoOutput> setNumberOfQuestions(int input);
  Future<NoOutput> setOnlyWeekQuestion(bool input);
}

const String NumberOfQuestionsKey = '_NumberOfQuestionsKey';
const String OnlyWeekQuestionKey = '_OnlyWeekQuestionKey';

class SettingsDataSourceImpl extends SettingsDataSource {
  final LocalStorage _localStorage;

  SettingsDataSourceImpl({LocalStorage localStorage}) : _localStorage = localStorage;
  @override
  Future<NumberOfQuestionModel> getNumberOfQuestions() async {
    final result = await _localStorage.getIntData(NumberOfQuestionsKey);
    return NumberOfQuestionModel(result ?? 10);
  }

  @override
  Future<OnlyWeekQuestionModel> getOnlyWeekQuestion() async {
    final result = await _localStorage.getBoolData(OnlyWeekQuestionKey);
    return OnlyWeekQuestionModel(result ?? false);
  }

  @override
  Future<NoOutput> setNumberOfQuestions(int input) async {
    await _localStorage.setIntData(NumberOfQuestionsKey, input);
    return NoOutput();
  }

  @override
  Future<NoOutput> setOnlyWeekQuestion(bool input) async {
    await _localStorage.setBoolData(OnlyWeekQuestionKey, input);
    return NoOutput();
  }
}
