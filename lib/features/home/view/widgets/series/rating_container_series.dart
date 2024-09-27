import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

class RatingContainerSeries extends StatelessWidget {
  const RatingContainerSeries({
    super.key,
    required this.series,
  });

  final Series series;

  @override
  Widget build(BuildContext context) {
    late Color containerColor;
    if (series.voteAverage > 6.5) {
      containerColor = Colors.green;
    } else if (series.voteAverage >= 4 && series.voteAverage <= 6.5) {
      containerColor = Colors.blue;
    } else {
      containerColor = Colors.red;
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
              (series.voteAverage).toStringAsFixed(1),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
