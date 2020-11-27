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
        appBar: MyAppBar(),
        body: Row(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(32.0),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Row(
                          children: [
                            Icon(Icons.fast_rewind),
                            Text(
                              'SETTINGS',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                            child: Text("NUMBER OF QUESTION"),
                          ),
                        ),
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
                                  BlocProvider.of<SettingsDropdownBloc>(context).add(ChangeNumberOfQuestion(newValue));
                                },
                                items: <int>[10, 20, 30, 40].map<DropdownMenuItem<int>>((int value) {
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                            child: Text("ONLY WEEK QUESTION"),
                          ),
                        ),
                        BlocBuilder<SettingsSwitchBloc, SettingsState>(
                          builder: (context, state) {
                            if (state is LoadedSettingsStateSwitch) {
                              return Switch(
                                value: state.onlyWeak,
                                onChanged: (value) {
                                  BlocProvider.of<SettingsSwitchBloc>(context).add(ChangeOnlyWeekSwitch(value));
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
