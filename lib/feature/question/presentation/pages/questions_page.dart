import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';
import 'package:job_interview_practice/feature/question/presentation/bloc/question_bloc.dart';

class QuestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<QuestionBloc>()..add(QuestionEvent()),
      child: Builder(
        builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text('Questions'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_question_page').then((value) {
                      if (value != null) {
                        BlocProvider.of<QuestionBloc>(context).add(QuestionEvent());
                      }
                    });
                  },
                )
              ],
            ),
            body: Builder(
              builder: (context) {
                return BlocBuilder<QuestionBloc, QuestionState>(builder: (context, state) {
                  if (state is QuestionsLoaded) {
                    return ListView.builder(
                      itemCount: state.questions.length,
                      itemBuilder: (_, index) {
                        final item = state.questions[index];
                        return PostWidget(item);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
              },
            )),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final QuestionUserModel model;

  PostWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(model.userModel.photoUrl),
                    radius: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                model.userModel.name,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          model.questionModel.createdAt,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 2),
              child: Text(
                "Question text:",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Text(model.questionModel.questionText),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: RatingBarIndicator(
                itemBuilder: (_, __) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 16,
                rating: model.questionModel.rate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
