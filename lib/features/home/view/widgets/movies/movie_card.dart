import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/features/home/view/widgets/movies/rating_container_movies.dart';
import 'package:movies_and_series_app/features/movie_details/view/movie_details_page.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MovieDetailsPage(
            movieID: movie.id,
          );
        }));
      },
      child: Card(
        color: const Color.fromARGB(255, 34, 41, 44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConfig.imageBaseUrl}${movie.posterPath}',
                    fit: BoxFit.fill,
                    height: 200,
                    width: 180,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 10,
                  child: movie.voteAverage == 0
                      ? Container()
                      : RatingContainerMovies(movie: movie),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: 180,
                child: Center(
                  child: Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
