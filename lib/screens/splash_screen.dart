import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatelessWidget {
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
              Colors.black.withOpacity(0.7),
              Colors.amber,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Please wait.Logging in..',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: LoadingIndicator(
                    colors: [Colors.deepOrange.shade200],
                    indicatorType: Indicator.squareSpin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
