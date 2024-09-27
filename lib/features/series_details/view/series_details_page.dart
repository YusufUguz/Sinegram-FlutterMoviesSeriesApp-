import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/movie_credits_model.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_cast.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/movie_details_titles.dart';
import 'package:movies_and_series_app/features/movie_details/view/widgets/series_dates_card.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_categories.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_image_area.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_info_container.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_network.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_overview.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_producers.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_seasons.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_status_info_card.dart';
import 'package:movies_and_series_app/features/series_details/view/widgets/series_tagline.dart';
import 'package:movies_and_series_app/features/series_details/view_model/series_details_view_model.dart';

class SeriesDetailsPage extends StatefulWidget {
  const SeriesDetailsPage({super.key, required this.seriesID});
  final int seriesID;
  @override
  State<SeriesDetailsPage> createState() => _SeriesDetailsPageState();
}

class _SeriesDetailsPageState extends State<SeriesDetailsPage> {
  late Future<SeriesDetails> _futureSeriesDetails;
  final List<MovieCredits> _seriesCredits = [];

  @override
  void initState() {
    super.initState();
    _futureSeriesDetails =
        SeriesDetailsViewModel().fetchSeriesDetails(widget.seriesID);
    fetchCredits(widget.seriesID);
  }

  Future<void> fetchCredits(int movieID) async {
    try {
      List<MovieCredits> fetchedCredits = [];
      final List<MovieCredits> seriesCredits =
          await SeriesDetailsViewModel().fetchSeriesCredits(movieID);

      fetchedCredits.addAll(seriesCredits);
      setState(() {
        _seriesCredits.clear();
        _seriesCredits.addAll(seriesCredits);
      });
    } catch (e) {
      debugPrint('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dizi Detayları"),
        centerTitle: true,
      ),
      body: FutureBuilder<SeriesDetails>(
        future: _futureSeriesDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            SeriesDetails seriesDetails = snapshot.data!;
            debugPrint("DİZİLER : ${seriesDetails.toString()}");
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SeriesImageArea(seriesDetails: seriesDetails),
                  SeriesTagline(seriesDetails: seriesDetails),
                  SeriesCategories(seriesDetails: seriesDetails),
                  SeriesInfoContainer(seriesDetails: seriesDetails),
                  MovieDetailsTitles(title: "Genel Bakış"),
                  SeriesOverview(seriesDetails: seriesDetails),
                  MovieDetailsTitles(title: "Sezonlar"),
                  SeriesSeasons(seriesDetails: seriesDetails),
                  MovieDetailsTitles(title: "Oyuncular"),
                  MovieCast(movieCredits: _seriesCredits),
                  MovieDetailsTitles(title: "Yapımcı Şirketler"),
                  SeriesProducersInfoCard(seriesDetails: seriesDetails),
                  MovieDetailsTitles(title: "Yayınlanan Platformlar"),
                  SeriesNetwork(seriesDetails: seriesDetails),
                  MovieDetailsTitles(title: "Bazı Bilgiler"),
                  SeriesDatesInfoCard(seriesDetails: seriesDetails),
                  SeriesStatusInfoCard(seriesDetails: seriesDetails),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
