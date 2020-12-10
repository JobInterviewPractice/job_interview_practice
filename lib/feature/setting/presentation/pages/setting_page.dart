import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_dropdown_bloc.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_event.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_state.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_switch_bloc.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<SettingsDropdownBloc>()),
        BlocProvider(create: (_) => serviceLocator<SettingsSwitchBloc>())
      ],
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: 'SETTINGS'),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("NUMBER OF QUESTION"),
                  SizedBox(width: 24,),
                  BlocBuilder<SettingsDropdownBloc, SettingsState>(
                    builder: (context, state) {
                      if (state is LoadedSettingsStateDropdown) {
                        return DropdownButton<int>(
                          value: state.dropdownValue,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (int newValue) {
                            BlocProvider.of<SettingsDropdownBloc>(context)
                                .add(ChangeNumberOfQuestion(newValue));
                          },
                          items: <int>[1, 2, 3]
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text("ONLY WEAK QUESTION"),
                  SizedBox(width: 24,),
                  BlocBuilder<SettingsSwitchBloc, SettingsState>(
                    builder: (context, state) {
                      if (state is LoadedSettingsStateSwitch) {
                        return Switch(
                          value: state.onlyWeak,
                          onChanged: (value) {
                            BlocProvider.of<SettingsSwitchBloc>(context)
                                .add(ChangeOnlyWeakSwitch(value));
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
