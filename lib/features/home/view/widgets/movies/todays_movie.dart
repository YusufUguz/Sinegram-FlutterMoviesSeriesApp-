import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';

class TodaysMovie extends StatelessWidget {
  const TodaysMovie({
    super.key,
    required this.topRatedMovies,
    required this.todaysFilm,
  });

  final List<Movie> topRatedMovies;
  final int todaysFilm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(100)),
          image: DecorationImage(
              image: NetworkImage(topRatedMovies.isNotEmpty
                  ? '${ApiConfig.imageBaseUrl}${topRatedMovies[todaysFilm].wideImagePath}'
                  : ""),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Chip(
              avatar: Icon(
                FontAwesomeIcons.film,
                color: Colors.white,
              ),
              label: Text(
                "Günün Filmi",
                style: TextStyle(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topRatedMovies[todaysFilm].title,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(
                    (topRatedMovies[todaysFilm].voteAverage).toStringAsFixed(1),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  avatar: const Icon(
                    FontAwesomeIcons.solidStar,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
