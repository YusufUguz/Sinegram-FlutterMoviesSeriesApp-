import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/see_all/see_all_movies.dart';
import 'package:movies_and_series_app/features/see_all/see_all_series.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

// ignore: must_be_immutable
class HomePageTitles extends StatelessWidget {
  HomePageTitles(
      {super.key,
      required this.title,
      required this.type,
      required this.specificType,
      required this.movieList,
      required this.seriesList});

  String title;
  List<Movie> movieList;
  List<Series> seriesList;
  String type;
  String specificType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if (type == "movie") {
                    return SeeAllMovies(
                        movies: movieList, specificType: specificType);
                  } else if (type == "series") {
                    return SeeAllSeries(
                      series: seriesList,
                      specificType: specificType,
                    );
                  } else {
                    return const Text("Hata");
                  }
                }));
              },
              child: const Text("Tümünü Gör"))
        ],
      ),
    );
  }
}
