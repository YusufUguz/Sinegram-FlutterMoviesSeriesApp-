import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/genre_model.dart';

class GenresViewModel {
  static Future<List<GeneralGenre>> fetchMoviesGenres() async {
    final response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/genre/movie/list?api_key=${ApiConfig.apiKey}&language=tr',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data["genres"];
      return results.map((json) => GeneralGenre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch genres');
    }
  }

   static Future<List<GeneralGenre>> fetchSeriesGenres() async {
    final response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/genre/tv/list?api_key=${ApiConfig.apiKey}&language=tr',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data["genres"];
      return results.map((json) => GeneralGenre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch genres');
    }
  }
}
