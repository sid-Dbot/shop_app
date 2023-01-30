import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Container(
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
                  Flexible(
                    child: Container(
                      height: deviceSize.height * 0.09,
                      width: deviceSize.width * 0.7,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 92),
                      transform: Matrix4.rotationZ(-9 * pi / 180),
                      //..translate(-10, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Center(
                        child: Text(
                          'Shop',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: deviceSize.height * 0.5,
                      width: deviceSize.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white60,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
