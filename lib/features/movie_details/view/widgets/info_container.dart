import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';

// ignore: must_be_immutable
class InfoContainer extends StatelessWidget {
  InfoContainer({
    super.key,
    required this.movieDetails,
  });

  MovieDetails movieDetails;
  late String originalLanguage;

  @override
  Widget build(BuildContext context) {
    if (movieDetails.originalLanguage == "en") {
      originalLanguage = "İngilizce";
    } else if (movieDetails.originalLanguage == "tr") {
      originalLanguage = "Türkçe";
    } else {
      originalLanguage = "";
    }
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: Constants.appsLighterMainColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/time.png",
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    "${movieDetails.runtime.toString()} dk.",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              /*  const VerticalDivider(
                color: Colors.black,
                thickness: 3,
                width: 3,
              ), */
              Column(
                children: [
                  Image.asset(
                    "assets/icons/money.png",
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    "${movieDetails.revenue.toString()}\$",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/icons/world.png",
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    originalLanguage,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
