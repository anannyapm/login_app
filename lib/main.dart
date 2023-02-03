import 'package:flutter/material.dart';

import 'package:login_app/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME = 'UserLoggedIn'; //value of shared prefrence stored here 

main() async {
  runApp(MyApp());
}


  

class MyApp extends StatelessWidget {
   MyApp({super.key});

  MaterialColor mycolor = MaterialColor(0xFF161C1C, <int, Color>{
      50: Color(0xFF161C1C),
      100: Color(0xFF161C1C),
      200: Color(0xFF161C1C),
      300: Color(0xFF161C1C),
      400: Color(0xFF161C1C),
      500: Color(0xFF161C1C),
      600: Color(0xFF161C1C),
      700: Color(0xFF161C1C),
      800: Color(0xFF161C1C),
      900: Color(0xFF161C1C),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Login',
      theme: ThemeData(
        primarySwatch: mycolor,
        fontFamily: 'Raleway',
      ),
      home: ScreenSplash(),
    );
  }
}
