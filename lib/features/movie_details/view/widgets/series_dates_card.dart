import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesDatesInfoCard extends StatelessWidget {
  SeriesDatesInfoCard({
    super.key,
    required this.seriesDetails,
  });

  SeriesDetails seriesDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: const Color.fromARGB(255, 34, 41, 44),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.calendar,
                    color: Constants.appsLighterMainColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Dizinin ilk bölümü ${DateFormat('dd-MM-yyyy').format(seriesDetails.firstAirDate)} tarihinde yayınlandı.",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.calendar,
                    color: Constants.appsLighterMainColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Dizinin son bölümü ${DateFormat('dd-MM-yyyy').format(seriesDetails.lastAirDate)} tarihinde yayınlandı.",
                      style: const TextStyle(fontSize: 18),
                    ),
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
