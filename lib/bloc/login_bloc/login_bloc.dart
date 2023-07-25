import 'package:authwithrest/bloc/auth_bloc/auth.dart';
import 'package:authwithrest/repositories/repositories.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepositories userRepositories;
  final AuthenticationBloc authenticationBloc;

  LoginBloc(this.userRepositories, this.authenticationBloc)
      : assert(userRepositories != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoding();

      try {
        final token = await userRepositories.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        LoginFailure(error: error.toString());
      }
    }
  }
}
