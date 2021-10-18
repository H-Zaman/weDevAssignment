import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:wedevassignment/app/pages/profile_page.dart';
import 'package:wedevassignment/others/resources/images.dart';
import 'package:wp_json_api/models/responses/wp_user_login_response.dart';
import 'package:wp_json_api/wp_json_api.dart';


class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'weDev',
      logo: Images.LOGO,
      onLogin: _authUser,
      onSignup: _authUser,
      loginAfterSignUp: false,
      onSubmitAnimationCompleted: () => Get.offAll(()=>ProfilePage()),
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        pageColorLight: Colors.white,
        switchAuthTextColor: Colors.black,
      ),
      messages: LoginMessages(
        signUpSuccess: 'Please login to continue'
      ),
    );
  }

  Future<String?>? _authUser(LoginData p1) async{
    WPJsonAPI.instance.initWith(baseUrl: "http://apptest.dokandemo.com", wpJsonPath: '/wp-json');
    try {
      WPUserLoginResponse wpUserLoginResponse = await WPJsonAPI.instance
        .api((request) => request.wpRegister(
        email: 'email@gmail.com',
        password: 'password',
        username : 'username'
      ));
    } on Exception catch (e) {
      print(e);
    }
    return '123';
  }

  Future<String?>? _recoverPassword(String p1) {
  }
}
