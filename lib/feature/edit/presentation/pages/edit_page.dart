import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyApp(),
      // body: ZoomPage(),
    );
  }
}

class MyApp extends StatelessWidget {
  var _cardList = List<PictureCard>();

  void init() {
    _cardList.add(PictureCard(
      'Torrance Beach',
      'The best beach in Torrance',
      'torrance-beach.jpg',
    ));
    _cardList.add(PictureCard(
      'Shake Shack',
      'American fast casual restaurant',
      'shake-shack.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      'the-hat.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      'the-hat.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      'the-hat.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      'the-hat.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      'the-hat.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      'the-hat.jpg',
    ));
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: _cardList.length,
        itemBuilder: (BuildContext context, int index) {
          return _cardList[index];
        },
      ),
    );
  }
}

class PictureCard extends StatelessWidget {
  final String _name;
  final String _desc;
  final String _picture;

  PictureCard(this._name, this._desc, this._picture);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text(_name),
            subtitle: Text(_desc),
          ),
          // Image.asset('assets/$_picture'),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('DIRECTION'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: const Text('MAP'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
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
