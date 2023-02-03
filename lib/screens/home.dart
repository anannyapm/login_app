import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_app/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  signOut(context);
                },
                icon: Icon(Icons.exit_to_app_rounded))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Farm Info #$index'),
                      subtitle: Text('This is the news details for the info #$index'),
                      leading: alternateImage(index),
                      trailing: Icon(Icons.more_horiz_rounded),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 30),
            ),
          ),
        ));
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }

  alternateImage(num index) {
    if (index % 2 == 0) {
      return CircleAvatar(
        backgroundImage:AssetImage('assets/images/raphael-rychetsky-li9JfUHQfOY-unsplash.jpg'),
        radius: 30,
      );
    } else {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/gabriel-jimenez-jin4W1HqgL4-unsplash.jpg'),fit: BoxFit.cover)),
        
        
      );
    }
  }
}
