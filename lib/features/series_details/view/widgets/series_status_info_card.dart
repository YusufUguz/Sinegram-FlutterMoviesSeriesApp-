import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesStatusInfoCard extends StatelessWidget {
  SeriesStatusInfoCard({
    super.key,
    required this.seriesDetails,
  });

  final SeriesDetails seriesDetails;
  late String seriesStatus;

  @override
  Widget build(BuildContext context) {
    if (seriesDetails.status == "Ended") {
      seriesStatus = "Dizi final yaparak yayın hayatını sonlandırdı.";
    } else if (seriesDetails.status == "Returning Series") {
      seriesStatus = "Dizi yayın hayatına devam ediyor,yeni bölümler gelecek.";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: const Color.fromARGB(255, 34, 41, 44),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.film,
                color: Constants.appsLighterMainColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  seriesStatus,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
