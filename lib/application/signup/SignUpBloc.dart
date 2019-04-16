import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/signup/SignUp.dart';
import 'package:clasick_flutter/application/authentication/Authentication.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/domain/model/Login.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserService userService;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.userService,
    @required this.authenticationBloc,
  })  : assert(userService != null),
        assert(authenticationBloc != null);

  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final token = await userService.signIn(
            LoginForm(
                event.username,
                event.password
            )
        );

        authenticationBloc.dispatch(LoggedIn(token: token.value));
        yield SignUpInitial();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
