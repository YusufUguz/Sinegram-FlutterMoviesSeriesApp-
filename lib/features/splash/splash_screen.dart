import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/general_widgets/navigation_bar_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });

    return SafeArea(                             
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backgrounds/background2.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo4.png",
                  width: 370,
                  height: 370,
                ),
                Image.asset(
                  "assets/loadings/loading4.gif",
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
