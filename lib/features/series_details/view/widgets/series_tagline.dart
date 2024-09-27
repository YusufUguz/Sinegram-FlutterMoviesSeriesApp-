import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesTagline extends StatelessWidget {
  SeriesTagline({
    super.key,
    required this.seriesDetails,
  });

  SeriesDetails seriesDetails;

  @override
  Widget build(BuildContext context) {
    debugPrint("series Tagline : ${seriesDetails.tagline}");
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "\"${seriesDetails.tagline}\"",
        style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      ),
    );
  }
}
