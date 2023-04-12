part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LogIn extends LoginEvent {
  final String? email;
final  String? password;

  LogIn(this.email, this.password);
}