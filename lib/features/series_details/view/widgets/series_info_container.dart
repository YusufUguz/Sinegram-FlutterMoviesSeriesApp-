import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesInfoContainer extends StatelessWidget {
  SeriesInfoContainer({
    super.key,
    required this.seriesDetails,
  });

  SeriesDetails seriesDetails;
  late String originalLanguage;

  @override
  Widget build(BuildContext context) {
    if (seriesDetails.originalLanguage == "en") {
      originalLanguage = "İngilizce";
    } else if (seriesDetails.originalLanguage == "tr") {
      originalLanguage = "Türkçe";
    } else if (seriesDetails.originalLanguage == "es") {
      originalLanguage = "İspanyolca";
    } else if (seriesDetails.originalLanguage == "ja") {
      originalLanguage = "Japonca";
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
                    "assets/icons/seasons.png",
                    width: 45,
                    height: 45,
                  ),
                  const Text(
                    "Sezon Sayısı",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    seriesDetails.numberOfSeasons.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/icons/episodes.png",
                    width: 45,
                    height: 45,
                  ),
                  const Text(
                    "Bölüm Sayısı",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    seriesDetails.numberOfEpisodes.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/icons/world.png",
                    width: 45,
                    height: 45,
                  ),
                  const Text(
                    "Orijinal Dil",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    originalLanguage,
                    style: const TextStyle(color: Colors.black, fontSize: 17),
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
