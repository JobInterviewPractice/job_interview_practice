import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_bloc.dart';
import 'package:job_interview_practice/feature/edit/presentation/bloc/edit_state.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

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
  var _cardList = List<PictureCard>();

  void init() {
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
    _cardList.add(PictureCard(questionText: "question 1", isWeak: false));
  }

  @override
  Widget build(BuildContext context) {
    init();
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
  final String questionText;
  final bool isWeak;

  // todo:こっちをいじる
  TextEditingController _quoteController = TextEditingController(text: "test");

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
                decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: 'Qeustion text here',
                    labelText: this.questionText),
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

class ZoomPage extends StatefulWidget {
  @override
  _ZoomPageState createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zoom Page"),
      ),
      body: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            print(details);
            _previousScale = _scale;
            setState(() {});
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            print(details);
            _scale = _previousScale * details.scale;
            setState(() {});
          },
          onScaleEnd: (ScaleEndDetails details) {
            print(details);

            _previousScale = 1.0;
            setState(() {});
          },
          child: RotatedBox(
            quarterTurns: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1578253809350-d493c964357f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
