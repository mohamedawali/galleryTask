import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallery/models/loginResponse.dart';
import 'package:meta/meta.dart';

import '../../Repository/loginRepo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;
  LoginBloc(this.loginRepo) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LogIn) {
        await logIn(event.email, event.password, emit);
      }
    });
  }

  Future logIn(
      String? email, String? password, Emitter<LoginState> emit) async {
    emit(Loading());
    await loginRepo.login(email, password).then((loginResponse) {
      emit(Loaded(loginResponse));
    });
  }
}
