import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_event.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(LoadingEditState()) {
    add(SetupEditEvent());
  }

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    if (event is SetupEditEvent) {
      yield LoadingEditState();
    } else if (event is ChangeQuestion) {
      yield LoadedEditState();
    } else if (event is PushAddButton) {
      yield LoadedEditState();
    } else {
      throw UnimplementedError();
    }
  }
}
