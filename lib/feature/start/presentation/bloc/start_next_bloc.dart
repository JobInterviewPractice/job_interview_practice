import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';

class StartNextBloc extends Bloc<StartEvent, StartState> {
  StartNextBloc() : super(LoadingStartState());

  @override
  Stream<StartState> mapEventToState(StartEvent event) async* {}
}
