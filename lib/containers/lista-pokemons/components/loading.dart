import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashTransition: SplashTransition.rotationTransition,
          splash: Image(
            image: AssetImage('assets/Pokeball.png'),
            color: Colors.red,
          ), nextScreen: LoadingPage(),
        ),
        //   Image(image: AssetImage('assets/Pokeball.png'),
      ),
    );
  }
}