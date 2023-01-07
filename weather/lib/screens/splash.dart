import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/home.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.public,
                  size: 90,
                  color: Colors.black,
                ),
                Icon(
                  Icons.thermostat,
                  size: 90,
                  color: Colors.black,
                ),
              ],
            ),
            Center(
              child: Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      duration: 3000,
      backgroundColor: Colors.blue,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
      nextScreen: home(),
      splashIconSize: 250,
    );
  }
}
