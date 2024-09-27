import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/movie_card.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';
import 'package:movies_and_series_app/features/lists/view_model/listed_movies_mixin.dart';

class ListedMovies extends StatefulWidget {
  const ListedMovies({super.key, required this.movieIDs});

  final List<dynamic> movieIDs;

  @override
  State<ListedMovies> createState() => _ListedMoviesState();
}

class _ListedMoviesState extends State<ListedMovies>
    with SingleTickerProviderStateMixin, ListedMoviesMixin {
  @override
  List<dynamic> get seriesIDs => widget.movieIDs;
  @override
  Widget build(BuildContext context) {
    debugPrint(
        "Liste sayfasına çekilen film sayısı ${filteredMovies.length.toString()}");
    debugPrint("Kaydeidlen ${widget.movieIDs.toString()}");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favori Filmlerim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: moviesFuture,
            builder: (context, snapshot) {
              /* if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } */
              /* if (snapshot.connectionState == ConnectionState.done &&
                  filteredMovies.isEmpty) {
                return const Center(child: Text("No movies found"));
              } */
              return filteredMovies.isEmpty
                  ? const Center(
                      child: Text("Kaydedilmiş film veya dizi yok."),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.65, crossAxisCount: 2),
                      shrinkWrap: true,
                      itemCount: filteredMovies.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Movie movie = filteredMovies[index];
                        debugPrint("MOVIE NAME : ${movie.title}");
                        return MovieCard(movie: movie);
                      });
            }),
      ),
    );
  }
}
