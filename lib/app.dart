import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevassignment/app/controllers/user_controller.dart';
import 'package:wedevassignment/app/pages/authentication.dart';

class MyApp extends StatelessWidget {
  MyApp(){
    Get.put(UserController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AuthenticationPage(),
    );
  }
}

