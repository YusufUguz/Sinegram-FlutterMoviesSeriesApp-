// ignore_for_file: library_private_types_in_public_api
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/color_schemes.g.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA8t5D16EiToMab4MVvzu8baeY0nMtE7cQ",
          appId: "1:184940264925:android:8d4d9593148f38cf3bca34",
          messagingSenderId: "184940264925",
          projectId: "sim-44fe1"));
  runApp(const Sinegram());
}

class Sinegram extends StatelessWidget {
  const Sinegram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinegram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              actionsIconTheme:
                  IconThemeData(color: Constants.appsLighterMainColor),
              backgroundColor: Color(0xff24292F),
              elevation: 0,
              scrolledUnderElevation: 0)),
      home: const SplashScreen(),
    );
  }
}
