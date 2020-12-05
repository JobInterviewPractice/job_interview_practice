import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_event.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_state.dart';
import 'package:job_interview_practice/feature/question/data/models/question.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository_impl.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  List<QuestionModel> questionModels;
  final QuestionRepositoryImpl questionRepositoryImpl;

  EditBloc({this.questionRepositoryImpl}) : super(LoadingEditState()) {
    add(SetupEditEvent());
  }

  Future<List<QuestionModel>> _loading() async {
    print("quesiontrepo: ${questionRepositoryImpl}");
    final _questionModels = await questionRepositoryImpl.selectAll();
    return _questionModels;
  }

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    if (event is SetupEditEvent) {
      List<QuestionModel> questions = await _loading();
      print("questions: ${questions}");
      yield LoadedEditState(allQuestions: questions);
    } else if (event is ChangeQuestion) {
      yield LoadedEditState();
    } else if (event is PushAddButton) {
      yield LoadedEditState();
    } else {
      throw UnimplementedError();
    }
  }
}
