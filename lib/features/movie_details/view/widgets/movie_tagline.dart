import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';

// ignore: must_be_immutable
class Tagline extends StatelessWidget {
  Tagline({
    super.key,
    required this.movieDetails,
  });

  MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "\"${movieDetails.tagline}\"",
        style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      ),
    );
  }
}
