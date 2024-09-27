import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/movie_card.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';

// ignore: must_be_immutable
class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({super.key, required this.movies, required this.needAll});
  bool needAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: needAll
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height * 1.25 / 3,
      child: needAll
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65, crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: movies.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(movie: movie);
              },
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(movie: movie);
              },
            ),
    );
  }
}
