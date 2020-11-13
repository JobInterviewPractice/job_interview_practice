import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
           'Get the job!',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: AppPage(),
          ),
        ),
      ),
      routes: <String, WidgetBuilder> {
        '/start_page': (BuildContext context) => StartPage(),
        '/edit_page': (BuildContext context) => EditPage(),
      },
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/start_page"),
                child: Text(
                  'Start',
                  style: TextStyle(
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/edit_page"),
                child: Text(
                  'Edit',
                  style: TextStyle(
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Get the job!',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset('images/image_interviewer.png'),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Start'),
                  RaisedButton(onPressed: () => Navigator.of(context).pop(), child: Text('戻る'),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Get the job!',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Edit'),
              RaisedButton(onPressed: () => Navigator.of(context).pop(), child: Text('戻る'),)
            ],
          ),
        ),
      ),
    );
  }
}
