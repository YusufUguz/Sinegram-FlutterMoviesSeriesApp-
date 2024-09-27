import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';

class HomeViewModel {
  static Future<List<Movie>> fetchMovies(int page) async {
    final http.Response response;

    response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/discover/movie?api_key=${ApiConfig.apiKey}&language=tr-TR&region=TR&page=$page&sort_by=vote_count.desc',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['results'];

      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  static Future<List<Series>> fetchSeries(int page) async {
    final http.Response response;

    response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/discover/tv?api_key=${ApiConfig.apiKey}&language=tr-TR&region=TR&page=$page&sort_by=vote_count.desc',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['results'];

      return results.map((json) => Series.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  static Future<List<Movie>> fetchMoviesLists(
      String movieType, bool isNeedRegion, int page) async {
    final http.Response response;
    if (isNeedRegion) {
      response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/movie/$movieType?api_key=${ApiConfig.apiKey}&language=tr-TR&region=TR&page=$page',
      ));
    } else {
      response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/movie/$movieType?api_key=${ApiConfig.apiKey}&language=tr-TR&page=$page',
      ));
    }

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['results'];

      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies list');
    }
  }

  static Future<List<Series>> fetchSeriesLists(String seriesType,
      List<int> excludedGenreIds, int page, String filters) async {
    final http.Response response;
    if (seriesType == "trending") {
      response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/trending/tv/week?api_key=${ApiConfig.apiKey}&language=tr-TR&page=$page',
      ));
    } else if (seriesType == "on_the_air") {
      response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/discover/tv?api_key=${ApiConfig.apiKey}&language=tr-TR&$filters&page=$page',
      ));
    } else {
      response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/discover/tv?api_key=${ApiConfig.apiKey}&language=tr-TR$filters&page=$page',
      ));
    }

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['results'];

      // Filtreleme işlemi
      final filteredResults = results
          .where((series) => !(series['genre_ids'] as List)
              .any((id) => excludedGenreIds.contains(id)))
          .toList();

      return filteredResults.map((json) => Series.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch series');
    }
  }
}
