import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/question/presentation/bloc/question_bloc.dart';

class QuestionAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => serviceLocator<QuestionAddBloc>(),
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "Add New Question"),
        body: Container(
          padding: EdgeInsets.all(25),
          color: Color.fromRGBO(250, 250, 250, 0.5),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: BlocBuilder<QuestionAddBloc, QuestionState>(
                    builder: (context, state) {
                  if (state is QuestionAddPageLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Question Text Here...',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (String input) => {
                            BlocProvider.of<QuestionAddBloc>(context).add(
                                QuestionChangeTextEvent(questionText: input))
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Back'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Register'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is QuestionAddTextChanged) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Question Text Here...',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (String input) => {
                            BlocProvider.of<QuestionAddBloc>(context).add(
                                QuestionChangeTextEvent(questionText: input))
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Back'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  print(state.editingQuestionText);
                                  BlocProvider.of<QuestionAddBloc>(context).add(
                                      QuestionAddEvent(
                                          questionText:
                                              state.editingQuestionText));
                                },
                                child: Text('Register'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text('something wrong...');
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
