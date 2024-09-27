import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/movie_credits_model.dart';

// ignore: must_be_immutable
class MovieCast extends StatelessWidget {
  MovieCast({
    super.key,
    required this.movieCredits,
  });

  List<MovieCredits> movieCredits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 320,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: movieCredits.length,
          itemBuilder: (context, index) {
            final movieCredit = movieCredits[index];
            return Card(
              color: const Color.fromARGB(255, 34, 41, 44),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: movieCredit.profilePath.isEmpty
                        ? Image.asset(
                            "assets/icons/movie3.png",
                            width: 170,
                            height: 190,
                          )
                        : Image.network(
                            "${ApiConfig.imageBaseUrl}${movieCredit.profilePath}",
                            width: 170,
                            height: 190,
                            fit: BoxFit.fill,
                          ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movieCredit.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            movieCredit.character,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
