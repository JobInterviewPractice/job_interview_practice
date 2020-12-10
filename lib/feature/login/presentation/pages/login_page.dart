import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/validators/validators.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/image_interviewer.png',
                          height: 150,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Job Interview - practice",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: Colors.teal),
                        ),
                        SizedBox(
                          height: 32,
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
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(SignInEvent(email: _emailController.text, password: _passwordController.text));
                                  }
                                },
                                title: Center(
                                    child: Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/sign_up_page');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "or Create new account",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 18,
                              ),
                            ],
                          ),
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
