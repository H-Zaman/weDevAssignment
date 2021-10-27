import 'package:get/get_utils/src/extensions/string_extensions.dart';

class CValidator{

  String? emailValidator(String? val){
    if(val!.isEmail){
      return null;
    }else{
      return 'Please enter a valid email';
    }
  }


  String? passwordValidator(String? val) {
    if(val!.length < 3){
      return 'Invalid password';
    }else{
      return null;
    }
  }

  String? nameValidator(String? val) {
    if(val!.trim().length > 0){
      return null;
    }else{
      return 'Please enter your name';
    }
  }
}