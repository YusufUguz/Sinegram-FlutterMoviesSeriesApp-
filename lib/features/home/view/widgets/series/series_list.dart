import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/series/series_card.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

// ignore: must_be_immutable
class SeriesList extends StatelessWidget {
  final List<Series> series;

  SeriesList({super.key, required this.series, required this.needAll});
  bool needAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: needAll
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height * 1.25 / 3,
      child: needAll
          ? GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: series.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65, crossAxisCount: 2),
              itemBuilder: (context, index) {
                final serie = series[index];
                return SeriesCard(series: serie);
              },
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                final serie = series[index];
                return SeriesCard(series: serie);
              },
            ),
    );
  }
}
