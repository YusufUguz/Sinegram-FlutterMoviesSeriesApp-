import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/home_page_titles.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/movie_list.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/todays_movie.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({
    super.key,
    required this.topRatedMovies,
    required this.todaysFilm,
    required this.newMovies,
    required this.popularMovies,
    required this.upcomingMovies,
  });

  final List<Movie> topRatedMovies;
  final List<Movie> popularMovies;
  final List<Movie> newMovies;
  final List<Movie> upcomingMovies;
  final int todaysFilm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TodaysMovie(topRatedMovies: topRatedMovies, todaysFilm: todaysFilm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageTitles(
                title: "Yeni Çıkanlar",
                type: "movie",
                movieList: newMovies,
                seriesList: const [],
                specificType: "Yeni Çıkan Filmler",
              ),
              MovieList(
                movies: newMovies,
                needAll: false,
              ),
              HomePageTitles(
                title: "En Çok Oylananlar",
                type: "movie",
                movieList: topRatedMovies,
                specificType: "En Çok Oylanan Filmler",
                seriesList: const [],
              ),
              MovieList(movies: topRatedMovies, needAll: false),
              HomePageTitles(
                title: "Popüler Filmler",
                movieList: popularMovies,
                type: "movie",
                seriesList: const [],
                specificType: "Popüler Filmler",
              ),
              MovieList(movies: popularMovies, needAll: false),
              HomePageTitles(
                title: "Türkiyede Vizyona Girecekler",
                movieList: upcomingMovies,
                type: "movie",
                specificType: "Vizyona Girecek Filmler",
                seriesList: const [],
              ),
              MovieList(movies: upcomingMovies, needAll: false),
            ],
          ),
        ),
      ]),
    );
  }
}
