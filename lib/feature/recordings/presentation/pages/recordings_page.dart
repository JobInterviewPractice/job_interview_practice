import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/recordings/presentation/bloc/recordings_bloc.dart';
import 'package:job_interview_practice/feature/recordings/presentation/pages/recording_details_page.dart';

class RecordingsPage extends StatelessWidget {
  var _selectedValue = 'Play';
  var _usStates = ["Play", "Delete"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "Recordings",
      ),
      body: BlocBuilder<RecordingsBloc, RecordingsState>(
          cubit: serviceLocator<RecordingsBloc>(),
          builder: (context, state) {
            if (state is Recordings) {
              return ListView.separated(
                itemCount: state.models.length,
                separatorBuilder: (_, __) {
                  return Divider();
                },
                itemBuilder: (_, index) {
                  final item = state.models[index];
                  return ListTile(
                    leading: Text(index.toString()),
                    title: Text(item.title),
                    subtitle: Text("Answered on ${item.model.questions.length} questions"),
                    trailing: Scaffold(
                  persistentFooterButtons: <Widget>[
                      PopupMenuButton<String>(
                        initialValue: _selectedValue,
                        onSelected: (String s) {
                          setState(() {
                            _selectedValue = s;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return _usStates.map((String s) {
                            return PopupMenuItem(
                              child: Text(s),
                              value: s,
                            );
                          }).toList();
                        },
                      )
                    ],
                //    onTap: () {
                      if (_selectedValue == "Play"){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => RecodingDetailsPage(item)));
                    }else if (_selectedValue == "Delete"){
                    builder: (BuildContext context, AsyncSnapshot<Tag> snapshot) {
                      if (mapController.ready &&
                          snapshot.hasData &&
                          snapshot.data.mobile.nid != 0) {
                        tag = snapshot.data;
                        widget.tagStream.sink.add(Tag());
                      }
                  }
                  },
                  )
                  );
                },
              );
            } else if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
