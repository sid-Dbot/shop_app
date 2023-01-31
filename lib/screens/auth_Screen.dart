import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/widgets/auth_card.dart';

enum AuthMode { Login, SignUp }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.pink.shade900.withOpacity(0.5),
                Colors.amber.withOpacity(0.7)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //margin: EdgeInsets.only(left: 20),
                  height: deviceSize.height * 0.1,
                  width: deviceSize.width * 0.85,
                  //padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 92),
                  transform: Matrix4.rotationZ(-9 * pi / 180),
                  //..translate(-10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                    child: Text(
                      'My Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.only(left: 50),
                height: deviceSize.height * 0.5,
                width: deviceSize.width * 0.7,
                // transform: Matrix4.rotationZ(8 * pi / 180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white,
                ),
                child: Card(
                  elevation: 11,
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: AuthCard(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
            child: Column(
          //shrinkWrap: true,
          children: [
            TextFormField(
                decoration: InputDecoration(
              label: Text(
                'Email',
              ),
            )),
            TextFormField(
                decoration: InputDecoration(
              label: Text('Password'),
            ))
          ],
        )),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                    overlayColor:
                        MaterialStateProperty.all(Colors.lightBlue.shade700),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 11, horizontal: 25))),
              ),
              TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.grey.shade800)),
                  onPressed: () {},
                  child: Text(
                    'Sign Up?',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
