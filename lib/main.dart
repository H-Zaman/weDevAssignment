import 'package:flutter/material.dart';
import 'package:wedevassignment/others/util/env.dart';

import 'app.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Env.init();

  runApp(const MyApp());
}