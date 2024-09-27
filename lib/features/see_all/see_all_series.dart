import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/home/view/widgets/series/series_list.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

// ignore: must_be_immutable
class SeeAllSeries extends StatelessWidget {
  SeeAllSeries({super.key, required this.series, required this.specificType});

  List<Series> series;
  String specificType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(specificType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SeriesList(
          series: series,
          needAll: true,
        ),
      ),
    );
  }
}
