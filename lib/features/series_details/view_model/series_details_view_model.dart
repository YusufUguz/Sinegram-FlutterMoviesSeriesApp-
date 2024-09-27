import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/movie_credits_model.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

class SeriesDetailsViewModel {
  Future<SeriesDetails> fetchSeriesDetails(int seriesID) async {
    final http.Response response;

    response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/tv/$seriesID?api_key=${ApiConfig.apiKey}&language=tr-TR'));

    if (response.statusCode == 200) {
      return SeriesDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load series details');
    }
  }

  Future<List<MovieCredits>> fetchSeriesCredits(int seriesID) async {
    final http.Response response;
    response = await http.get(Uri.parse(
        "${ApiConfig.baseUrl}/tv/$seriesID/credits?api_key=${ApiConfig.apiKey}&language=tr-TR"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['cast'];

      return results.map((json) => MovieCredits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load series credits');
    }
  }
}
