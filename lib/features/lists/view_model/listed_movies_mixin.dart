import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

import '../../home/view_model/home_view_model.dart';

mixin ListedMoviesMixin<ListedMovies extends StatefulWidget>
    on State<ListedMovies> implements TickerProvider {
  List<Movie> filteredMovies = [];
  List<Series> filteredSeries = [];
  late Future<void> moviesFuture;
  late Future<void> seriesFuture;

  List<dynamic> get seriesIDs;

  Future<void> fetchAndFilterMovies() async {
    int totalPages = 250;
    List<Movie> fetchedMovies = [];

    for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) {
      final List<Movie> currentPageMovies =
          await HomeViewModel.fetchMovies(pageNumber);
      setState(() {
        fetchedMovies.addAll(currentPageMovies);
        filteredMovies = fetchedMovies
            .where((movie) => seriesIDs.contains(movie.id))
            .toList();
      });
    }

    debugPrint(fetchedMovies.length.toString());
    debugPrint(fetchedMovies[1].title);
    debugPrint(fetchedMovies[1].id.toString());
  }

  Future<void> fetchAndFilterSeries() async {
    int totalPages = 250;
    List<Series> fetchedSeries = [];

    for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) {
      final List<Series> currentPageMovies =
          await HomeViewModel.fetchSeries(pageNumber);
      setState(() {
        fetchedSeries.addAll(currentPageMovies);
        filteredSeries = fetchedSeries
            .where((movie) => seriesIDs.contains(movie.id))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    moviesFuture = fetchAndFilterMovies();
    seriesFuture = fetchAndFilterSeries();
  }
}
