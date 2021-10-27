import 'package:wedevassignment/app/data/api_response_model.dart';
import 'package:wedevassignment/others/config/api.dart';
import 'package:wedevassignment/others/config/api_routes.dart';

class AuthRepo{
  Future<AResponse> login (String name, String password) async{
    final params = {
      "username": name,
      "password": password
    };

    return await Api.post(ApiRoutes.AUTH_LOGIN, queryParams: params);
  }

  Future<AResponse> register (String name, String email, String password) async{
    final data = {
      "username": name,
      "email": email,
      "password": password
    };

    return await Api.post(ApiRoutes.AUTH_REGISTER, data: data);
  }
}