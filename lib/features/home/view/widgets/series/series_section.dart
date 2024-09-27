import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/general_widgets/loader.dart';
import 'package:movies_and_series_app/features/home/view/widgets/home_page_titles.dart';
import 'package:movies_and_series_app/features/home/view/widgets/series/series_list.dart';
import 'package:movies_and_series_app/features/home/view/widgets/series/todays_series.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

class SeriesSection extends StatelessWidget {
  const SeriesSection({
    super.key,
    required this.topRatedSeries,
    required this.todaysSeries,
    required this.popularSeries,
    required this.newEpisodes,
  });

  final List<Series> topRatedSeries;
  final List<Series> popularSeries;
  final List<Series> newEpisodes;
  final int todaysSeries;

  @override
  Widget build(BuildContext context) {
    debugPrint(topRatedSeries.length.toString());
    return topRatedSeries.isEmpty
        ? const Loader()
        : SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TodaysSeries(
                  topRatedSeries: topRatedSeries, todaysSeries: todaysSeries),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomePageTitles(
                      title: "Popüler Diziler",
                      type: "series",
                      seriesList: popularSeries,
                      movieList: const [],
                      specificType: "Popüler Diziler",
                    ),
                    SeriesList(series: popularSeries, needAll: false),
                    HomePageTitles(
                      title: "En Çok Oylananlar",
                      type: "series",
                      seriesList: topRatedSeries,
                      movieList: const [],
                      specificType: "En Çok Oylanan Diziler",
                    ),
                    SeriesList(
                      series: topRatedSeries,
                      needAll: false,
                    ),
                    HomePageTitles(
                      title: "Yeni Bölümler Geliyor",
                      specificType: "Yeni Bölümleri Gelecek Diziler",
                      type: "series",
                      movieList: const [],
                      seriesList: newEpisodes,
                    ),
                    SeriesList(series: newEpisodes, needAll: false),
                  ],
                ),
              ),
            ]),
          );
  }
}
