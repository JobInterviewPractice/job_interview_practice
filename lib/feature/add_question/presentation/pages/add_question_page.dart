import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/add_question/presentation/bloc/add_question_cubit.dart';
import 'package:job_interview_practice/feature/question/presentation/widgets/appBar.dart';

class AddQuestionPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<AddQuestionCubit>(),
      child: Scaffold(
        appBar: MyAppBar(
          apptitle: 'Add question',
        ),
        body: Builder(
          builder: (context) {
            return BlocListener<AddQuestionCubit, AddQuestionState>(
            listener: (_, state) {
              if (state is AddQuestionSuccess) {
                Navigator.pop(context, true);
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Form(
                      key: _key,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Cannot be empty";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          BlocProvider.of<AddQuestionCubit>(context).addQuestion(value);
                        },
                        maxLines: 10,
                        decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Write your question"),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<AddQuestionCubit, AddQuestionState>(
                      builder: (context, state) {
                        if (state is AddQuestionLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return FlatButton(
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              _key.currentState.save();
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.teal,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
          },
        ),
      ),
    );
  }
}
