import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevassignment/app/pages/authentication_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AuthenticationPage(),
    );
  }
}
