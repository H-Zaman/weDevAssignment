import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env{

  Env._();

  static final _dotEnv = DotEnv();

  static late String apiLink;

  static init() async{
    try{
      await _dotEnv.load();
      apiLink = _dotEnv.env['API_LINK']!;
      debugPrint('.env LOADED');
    }catch(e){
      debugPrint('.env LOAD FAILED > ${e.toString()}');

    }

  }
}