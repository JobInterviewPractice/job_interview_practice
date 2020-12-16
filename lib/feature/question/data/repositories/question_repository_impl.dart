import 'package:job_interview_practice/feature/question/data/datasources/questions_data_source.dart';
import 'package:job_interview_practice/feature/question/data/models/question_model.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionsDataSource dataSource;

  QuestionRepositoryImpl({this.dataSource});

  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion) async {
    final result = await dataSource.getRandomQuestions(numberOfQuestion);
    return result;
  }

  @override
  Future<void> rateQuestion(String questionId, int rate) {
    return dataSource.rateQuestion(questionId, rate);
  }

  @override
  Future<List<QuestionUserModel>> getAll() {
    return dataSource.getAllQuestions();
  }

  Future<void> insert(String questionText) async {
    final result = await dataSource.insertQuestion(questionText);
  }
}
