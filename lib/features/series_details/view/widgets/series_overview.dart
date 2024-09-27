import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesOverview extends StatelessWidget {
  SeriesOverview({
    super.key,
    required this.seriesDetails,
  });

  SeriesDetails seriesDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Text(
        seriesDetails.overview,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
