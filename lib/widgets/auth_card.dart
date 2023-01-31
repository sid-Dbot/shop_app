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
// Padding(
//                       padding: const EdgeInsets.only(top: 50, right: 30),)