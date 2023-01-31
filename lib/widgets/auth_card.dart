import 'dart:math';

import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            transform: Matrix4.rotationZ(-8 * pi / 180),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        Form(
            child: Column(
          //shrinkWrap: true,
          children: [
            TextFormField(
                decoration: InputDecoration(
              label: Text('Email'),
            )),
            TextFormField(
                decoration: InputDecoration(
              label: Text('Password'),
            ))
          ],
        )),
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Container(
            transform: Matrix4.rotationZ(-8 * pi / 180),
            child: Column(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Login')),
                TextButton(onPressed: () {}, child: Text('Sign Up'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
// Padding(
//                       padding: const EdgeInsets.only(top: 50, right: 30),)