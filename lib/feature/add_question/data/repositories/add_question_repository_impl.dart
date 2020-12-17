import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/add_question/data/datasources/add_question_remote_data_source.dart';
import 'package:job_interview_practice/feature/add_question/domain/repositories/add_question_repository.dart';

class AddQuestionRepositoryImpl extends AddQuestionRepository {
  final AddQuestionRemoteDataSource dataSource;

  AddQuestionRepositoryImpl(this.dataSource);

  @override
  Future<NoOutput> addQuestion(String questionText) {
    return dataSource.addQuestion(questionText);
  }
}
