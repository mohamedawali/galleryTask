import 'package:dio/dio.dart';
import 'package:gallery/constant/strings.dart';

class LoginService {
  Dio? dio;
  LoginService(this.dio) {
    BaseOptions baseOptions = BaseOptions(baseUrl: url);
    dio = Dio(baseOptions);
  }

  Future<Map<String, dynamic>> login(String? email, String? password) async {
    Response response = await dio!
        .post("auth/login", data: {"email": email, "password": password});

    return response.data;
  }
}
