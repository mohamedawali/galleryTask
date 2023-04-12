import 'package:gallery/webService/loginService.dart';

import '../models/loginResponse.dart';

class LoginRepo{
  final LoginService loginService;

  LoginRepo(this.loginService);

  Future <LoginResponse>login(String? email, String? password)async{
    var response =await loginService.login(email,password);
    return  LoginResponse.fromJson(response);

  }
}