import 'package:authwithrest/bloc/auth_bloc/auth.dart';
import 'package:authwithrest/bloc/login_bloc/login_bloc.dart';
import 'package:authwithrest/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepositories userRepositories;

  const LoginScreen({super.key, required this.userRepositories})
      : assert(userRepositories != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              userRepositories, BlocProvider.of<AuthenticationBloc>(context));
        },
      ),
    );
  }
}
