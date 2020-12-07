import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_bloc.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_state.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "EDIT",
      ),
      body: EditWidget(),
      // body: ZoomPage(),
    );
  }
}

class EditWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<EditBloc>(),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<EditBloc, EditState>(
                builder: (context, state) {
                  if (state is LoadingEditState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is LoadedEditState) {
                    print(state);
                    return ListView.builder(
                      itemCount: state.allQuestions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PictureCard(
                            questionText:
                                state.allQuestions[index].questionText,
                            isWeak: state.allQuestions[index].isWeek);
                      },
                    );
                  }
                  return Center(child: Text("something wrong"));
                },
              ),
            ),
            IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () => {print("pressed")})
          ],
        ),
        // todo: question add button in fix position
      ),
    );
  }
}

class PictureCard extends StatelessWidget {
  String questionText;
  bool isWeak;

  TextEditingController _quoteController =
      TextEditingController(text: questionText);

  PictureCard({this.questionText, this.isWeak});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      color: Color.fromRGBO(232, 236, 242, 1),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: TextFormField(
                controller: _quoteController,
                decoration: InputDecoration(labelText: this.questionText),
                onSaved: (String value) {},
                validator: (String value) {},
              ),
            ),
            // Image.asset('assets/$_picture'),
          ],
        ),
      ),
    );
  }
}
