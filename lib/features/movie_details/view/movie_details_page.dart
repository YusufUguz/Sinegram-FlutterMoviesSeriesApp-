import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/build_movie_details.dart';
import 'package:movies_and_series_app/core/model/movie_credits_model.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';
import 'package:movies_and_series_app/features/movie_details/view_model/movie_details_view_model.dart';
import "package:http/http.dart" as http;

// ignore: must_be_immutable
class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.movieID});

  final int movieID;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Future<MovieDetails> _futureMovieDetails;
  final List<MovieCredits> _movieCredits = [];
  late List<dynamic> _buyData = [];
  late List<dynamic> _flatrateData = [];

  @override
  void initState() {
    super.initState();
    _futureMovieDetails =
        MovieDetailsViewModel().fetchMovieDetails(widget.movieID);
    fetchCredits(widget.movieID);
    fetchMovieProviders(widget.movieID);
  }

  Future<void> fetchMovieProviders(int movieID) async {
    final response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/movie/$movieID/watch/providers?api_key=${ApiConfig.apiKey}')); // API_URL burada API'nin gerçek URL'si olmalı

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data.containsKey('results')) {
        Map<String, dynamic> results = data['results'];

        if (results.containsKey('TR')) {
          Map<String, dynamic> trData = results['TR'];
          setState(() {
            _buyData =
                trData.containsKey('buy') ? List.from(trData['buy']) : [];
            _flatrateData = trData.containsKey('flatrate')
                ? List.from(trData['flatrate'])
                : [];
          });
        } else {
          debugPrint("TR anahtarı bulunamadı.");
        }
      } else {
        debugPrint("results anahtarı bulunamadı.");
      }
    }
  }

  Future<void> fetchCredits(int movieID) async {
    try {
      List<MovieCredits> fetchedCredits = [];
      final List<MovieCredits> movieCredits =
          await MovieDetailsViewModel().fetchMovieCredits(movieID);

      fetchedCredits.addAll(movieCredits);
      setState(() {
        _movieCredits.clear();
        _movieCredits.addAll(movieCredits);
      });
    } catch (e) {
      debugPrint('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Detayları'),
      ),
      body: FutureBuilder<MovieDetails>(
        future: _futureMovieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return buildMovieDetails(snapshot.data!, context, _movieCredits,
                _buyData, _flatrateData);
          }
        },
      ),
    );
  }
}
