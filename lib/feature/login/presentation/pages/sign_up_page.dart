import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_interview_practice/core/validators/validators.dart';
import 'package:job_interview_practice/feature/login/presentation/bloc/login_bloc.dart';

import '../../../../dependencies.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _emailController;
  TextEditingController _passwordController;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<LoginBloc>(),
      child: Builder(
        builder: (context) {
          return BlocListener<LoginBloc, LoginState>(
            listener: (_, state) {
              if (state is LoginError) {
                _scaffoldKey.currentState.hideCurrentSnackBar();
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(state.toString())));
              } else if (state is LoginSuccess) {
                Navigator.pushNamed(context, '/home_page');
              }
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Create new account'),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: getImage,
                            child: FormField(
                              validator: (_) {
                                if (_image == null) {
                                  return 'Avatar is required';
                                }
                                return null;
                              },
                              builder: (state) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Colors.teal,
                                      backgroundImage: _image != null ? FileImage(_image) : null,
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (state.hasError) ...[
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        state.errorText,
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ]
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: Validators.emailValidator,
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          validator: Validators.notEmpty,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (_passwordController.text == value) {
                              return null;
                            }
                            return "Passwords must be equal";
                          },
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Repeat password', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (_, state) {
                            if (state is LoginLoading) {
                              return Card(
                                  color: Colors.teal,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ));
                            }
                            return Card(
                              color: Colors.teal,
                              child: ListTile(
                                onTap: () {
                                  if (_key.currentState.validate()) {
                                    BlocProvider.of<LoginBloc>(context).add(SignUpEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        filePath: _image.path));
                                  }
                                },
                                title: Center(
                                    child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
