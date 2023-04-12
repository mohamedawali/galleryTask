part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class Loading extends LoginState {

 Loading();
}
class Loaded extends LoginState {
 final LoginResponse loginResponse;
  Loaded(this. loginResponse);

}
