import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';

// ignore: must_be_immutable
class MovieOverview extends StatelessWidget {
  MovieOverview({
    super.key,
    required this.movieDetails,
  });

  MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Text(
        movieDetails.overview,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
