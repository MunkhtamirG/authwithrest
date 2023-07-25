import 'package:authwithrest/bloc/auth_bloc/auth.dart';
import 'package:authwithrest/repositories/repositories.dart';
import 'package:authwithrest/screens/auth_screen/intro_screen.dart';
import 'package:authwithrest/screens/main_screen/main_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepositories userRepositories = UserRepositories();
  runApp(BlocProvider(
    create: (context) {
      return AuthenticationBloc(userRepositories: userRepositories)
        ..add(AppStarted());
    },
    child: MyApp(userRepositories: userRepositories),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepositories userRepositories;
  const MyApp({Key? key, required this.userRepositories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return MainScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroPage(userRepository: userRepositories);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(body: CircularProgressIndicator());
          }
          return Scaffold(body: CircularProgressIndicator());
        },
      ),
    );
  }
}
