import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/search_results_model.dart';

class SearchViewModel {
  static Future<List<SearchResults>> fetchSearch(int page, String query) async {
    final http.Response response;

    response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/search/multi?query=$query&api_key=${ApiConfig.apiKey}&language=tr-TR&region=TR&page=$page',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['results'];

      return results.map((json) => SearchResults.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch Search results');
    }
  }
}
