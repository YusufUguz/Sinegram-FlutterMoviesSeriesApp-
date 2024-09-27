import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

class TodaysSeries extends StatelessWidget {
  const TodaysSeries({
    super.key,
    required this.topRatedSeries,
    required this.todaysSeries,
  });

  final List<Series> topRatedSeries;
  final int todaysSeries;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(100)),
          image: DecorationImage(
              image: NetworkImage(topRatedSeries.isNotEmpty
                  ? '${ApiConfig.imageBaseUrl}${topRatedSeries[todaysSeries].wideImagePath}'
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
                "Günün Dizisi",
                style: TextStyle(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topRatedSeries[todaysSeries].title,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(
                    (topRatedSeries[todaysSeries].voteAverage)
                        .toStringAsFixed(1),
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
