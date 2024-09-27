import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/movies_by_genre/view/movies_by_genre.dart';
import 'package:movies_and_series_app/features/series_by_genre/series_by_genre.dart';
import 'package:movies_and_series_app/core/model/genre_model.dart';

// ignore: must_be_immutable
class GenreCard extends StatelessWidget {
  GenreCard({
    super.key,
    required this.genre,
    required this.genreType,
  });

  final GeneralGenre genre;
  String genreType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (genreType == "Movie") {
            return MoviesByGenre(
                selectedGenreIds: [genre.id], selectedGenreName: genre.name);
          } else if (genreType == "Series") {
            return SeriesByGenre(
              selectedGenreIds: [genre.id],
              selectedGenreName: genre.name,
            );
          } else {
            return const Text("Hata");
          }
        }));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                genreType == "Movie"
                    ? "assets/movie_genres/${genre.name}.jpg"
                    : "assets/series_genres/${genre.name}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
          ),
          Center(
            child: Text(
              genre.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
