// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/info_container.dart';
import 'package:movies_and_series_app/core/model/movie_credits_model.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_broadcast_date_info_card.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_broadcast_platforms.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_budget_info_card.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_cast.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_categories.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_details_titles.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_overview.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_picture_area.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_producers.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_tagline.dart';

Widget buildMovieDetails(
    MovieDetails movieDetails,
    BuildContext context,
    List<MovieCredits> movieCredits,
    List<dynamic> buyData,
    List<dynamic> flatrateData) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        PictureArea(movieDetails: movieDetails),
        Tagline(movieDetails: movieDetails),
        MovieCategories(movieDetails: movieDetails),
        InfoContainer(
          movieDetails: movieDetails,
        ),
        MovieDetailsTitles(
          title: "Genel Bakış",
        ),
        MovieOverview(movieDetails: movieDetails),
        MovieDetailsTitles(title: "Oyuncular"),
        MovieCast(movieCredits: movieCredits),
        MovieDetailsTitles(title: "Yayınlanan Platformlar"),
        buyData.isEmpty && flatrateData.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Film şuan sinemalarda olabilir veya Türkiye'de filmin yayınlandığı bir platform bulunmamaktadır.",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              )
            : MovieBroadcastPlatforms(
                buyData: buyData, flatrateData: flatrateData),
        MovieDetailsTitles(
          title: "Bazı Bilgiler",
        ),
        BudgetInfoCard(
          movieDetails: movieDetails,
        ),
        MovieProducersInfoCard(movieDetails: movieDetails),
        MovieBroadcastDateInfoCard(movieDetails: movieDetails),
      ],
    ),
  );
}
