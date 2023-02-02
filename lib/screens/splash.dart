import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_app/main.dart';
import 'package:login_app/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/layered-waves-haikei.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              children: [
                Image.asset('assets/images/LogoFull.png'),
                Text(
                  'Lets Connect with Freedom . . .',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  Future<void> checkUserLogin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.getBool(SAVE_KEY_NAME);
    
  }
}
