import 'dart:ffi';

import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.pink.shade900.withOpacity(0.5),
                Colors.amber.withOpacity(0.7)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            )),
          ),
        ],
      ),
    );
  }
}
