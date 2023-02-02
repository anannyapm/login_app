import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_app/screens/home.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Value is Empty';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('Data Empty');
                      }
                    },
                    icon: Icon(Icons.check),
                    label: Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //function to validate
  //build context passed for snackbar. it needs context from widget to be passed here.
  void checkLogin(BuildContext ctx) {
    final _loginCredential = {'name': "anannya", 'password': 'abcd@123'};
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == _loginCredential['name'] &&
        _password == _loginCredential['password']) {
      //go to home
      //replacing login screen as we dont want to got to backpage when back is pressed
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      //popup on invalid data

      //since scaffold inside buildcontext we are calling from outside it, we are using scaffoldmessenger
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
          backgroundColor: Colors.redAccent,
          content: Text('Invalid Username or Password')));
    }
  }
}
