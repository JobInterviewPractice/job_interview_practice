import 'package:bloc/bloc.dart';
import 'package:job_interview_practice/feature/add_question/domain/usecases/add_question_usecase.dart';
import 'package:meta/meta.dart';

part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  final AddQuestionUseCase useCase;

  AddQuestionCubit(this.useCase) : super(AddQuestionInitial());

  void addQuestion(String questionText) async {
    emit(AddQuestionLoading());
    await useCase(questionText);
    emit(AddQuestionSuccess());
  }
}
