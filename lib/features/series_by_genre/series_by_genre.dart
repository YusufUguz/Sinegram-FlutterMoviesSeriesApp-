import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/features/home/view/widgets/series/series_card.dart';
import "package:http/http.dart" as http;
import 'package:movies_and_series_app/core/model/series_model.dart';
import 'package:movies_and_series_app/core/general_widgets/loader.dart';

class SeriesByGenre extends StatefulWidget {
  const SeriesByGenre(
      {super.key,
      required this.selectedGenreIds,
      required this.selectedGenreName});

  final List<int> selectedGenreIds;
  final String selectedGenreName;
  @override
  State<SeriesByGenre> createState() => _SeriesByGenreState();
}

class _SeriesByGenreState extends State<SeriesByGenre> {
  @override
  void initState() {
    super.initState();
    fetchAllSeries();
  }

  List<Series> allSeries = [];

  Future<void> fetchAllSeries() async {
    const int totalPages = 250;

    for (int page = 1; page <= totalPages; page++) {
      List<Series> currentPageMovies = await fetchSeriesForPage(page);
      setState(() {
        allSeries.addAll(currentPageMovies);
      });
    }

    debugPrint('Toplam ${allSeries.length} dizi çekildi.');
  }

  Future<List<Series>> fetchSeriesForPage(int page) async {
    final response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/discover/tv?api_key=${ApiConfig.apiKey}&include_adult=false&language=tr_TR&sort_by=vote_count.desc&without_genres=10751%2C10763%2C107654%2C10766&page=$page',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      List<Series> movies =
          results.map((json) => Series.fromJson(json)).toList();
      List<Series> filteredMovies = [];

      for (var movie in movies) {
        if (movie.genreIds.any((id) => widget.selectedGenreIds.contains(id))) {
          filteredMovies.add(movie);
        }
      }

      return filteredMovies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(allSeries.length.toString());
    debugPrint("selected genre:${widget.selectedGenreIds.length.toString()}");
    return allSeries.isEmpty
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              title: Text("${widget.selectedGenreName} Dizileri"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: allSeries.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.65, crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    final series = allSeries[index];
                    return SeriesCard(series: series);
                  })),
            ));
  }
}
