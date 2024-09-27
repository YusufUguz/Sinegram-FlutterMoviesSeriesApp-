import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieDetailsTitles extends StatelessWidget {
  MovieDetailsTitles({
    super.key,
    required this.title,
  });

  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
