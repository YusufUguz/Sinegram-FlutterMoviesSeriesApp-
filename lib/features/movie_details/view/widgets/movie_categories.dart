import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';

// ignore: must_be_immutable
class MovieCategories extends StatelessWidget {
  MovieCategories({
    super.key,
    required this.movieDetails,
  });

  MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 40,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieDetails.genres.length,
            itemBuilder: (context, index) {
              final movieGenre = movieDetails.genres[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 120,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Constants.appsLighterMainColor),
                  child: Center(
                    child: Text(
                      movieGenre.name,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
