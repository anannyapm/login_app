import 'package:flutter/material.dart';

import 'package:login_app/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Login',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ScreenSplash(),
    );
  }
}
