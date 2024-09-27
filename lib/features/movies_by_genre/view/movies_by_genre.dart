import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/movie_card.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';
import 'package:movies_and_series_app/features/movies_by_genre/view_model/movies_by_genre_view_model.dart';
import 'package:movies_and_series_app/core/general_widgets/loader.dart';

class MoviesByGenre extends StatefulWidget {
  const MoviesByGenre(
      {super.key,
      required this.selectedGenreIds,
      required this.selectedGenreName});

  final List<int> selectedGenreIds;
  final String selectedGenreName;
  @override
  State<MoviesByGenre> createState() => _MoviesByGenreState();
}

class _MoviesByGenreState extends State<MoviesByGenre> {
  @override
  void initState() {
    super.initState();
    fetchAllMovies();
  }

  List<Movie> allMovies = [];

  Future<void> fetchAllMovies() async {
    const int totalPages = 250;

    for (int page = 1; page <= totalPages; page++) {
      List<Movie> currentPageMovies = await MoviesByGenreViewModel()
          .fetchMoviesForPage(page, widget.selectedGenreIds);
      setState(() {
        allMovies.addAll(currentPageMovies);
      });
    }

    debugPrint('Toplam ${allMovies.length} film çekildi.');
  }

  @override
  Widget build(BuildContext context) {
    return allMovies.isEmpty
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              title: Text("${widget.selectedGenreName} Filmleri"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: allMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.65, crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    final movie = allMovies[index];
                    return MovieCard(movie: movie);
                  })),
            ));
  }
}
