import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/movie_list.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';

// ignore: must_be_immutable
class SeeAllMovies extends StatelessWidget {
  SeeAllMovies({super.key, required this.movies,required this.specificType});

  List<Movie> movies;
  String specificType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(specificType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MovieList(
          movies: movies,
          needAll: true,
        ),
      ),
    );
  }
}
