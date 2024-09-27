import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesSeasons extends StatelessWidget {
  SeriesSeasons({
    super.key,
    required this.seriesDetails,
  });

  SeriesDetails seriesDetails;
  late Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 450,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: seriesDetails.seasons.length,
          itemBuilder: (context, index) {
            final season = seriesDetails.seasons[index];
            if (season.voteAverage > 6.5) {
              containerColor = Colors.green;
            } else if (season.voteAverage >= 4 && season.voteAverage <= 6.5) {
              containerColor = Colors.blue;
            } else {
              containerColor = Colors.red;
            }
            return Stack(
              children: [
                Card(
                  color: const Color.fromARGB(255, 34, 41, 44),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: season.posterPath.isEmpty
                                ? Image.asset(
                                    "assets/icons/movie3.png",
                                    width: 230,
                                    height: 250,
                                  )
                                : Image.network(
                                    "${ApiConfig.imageBaseUrl}${season.posterPath}",
                                    width: 230,
                                    height: 250,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: containerColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.solidStar,
                                        size: 15,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        (season.voteAverage).toStringAsFixed(1),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 230,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\n${season.name}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\nYayın Tarihi : ${DateFormat('dd-MM-yy').format(season.airDate)}\n",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Text(
                                  "Bölüm Sayısı : ${season.episodeCount}\n",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Visibility(
                                  visible: season.overview != "",
                                  child: const Text(
                                    "Genel Bakış\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Visibility(
                                  visible: season.overview != "",
                                  child: Text(
                                    season.overview,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Constants.appsLighterMainColor),
                        child: Center(
                          child: Text(
                            season.seasonNumber.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        )))
              ],
            );
          },
        ),
      ),
    );
  }
}
