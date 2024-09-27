import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/series_model.dart';
import 'package:movies_and_series_app/features/home/view/widgets/series/series_card.dart';
import 'package:movies_and_series_app/features/lists/view_model/listed_movies_mixin.dart';

class ListedSeries extends StatefulWidget {
  const ListedSeries({super.key, required this.seriesIDs});

  final List<dynamic> seriesIDs;

  @override
  State<ListedSeries> createState() => _ListedMoviesState();
}

class _ListedMoviesState extends State<ListedSeries>
    with SingleTickerProviderStateMixin, ListedMoviesMixin {
  @override
  List<dynamic> get seriesIDs => widget.seriesIDs;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3));
    debugPrint(
        "Liste sayfasına çekilen dizi sayısı ${filteredMovies.length.toString()}");
    debugPrint("Kaydeidlen ${widget.seriesIDs.toString()}");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favori Dizilerim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: seriesFuture,
            builder: (context, snapshot) {
              if (filteredSeries.isEmpty) {
                return const Center(
                    child: Text("Kaydedilmiş film veya dizi yok."));
              } else {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.65, crossAxisCount: 2),
                    shrinkWrap: true,
                    itemCount: filteredSeries.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Series serie = filteredSeries[index];
                      debugPrint("MOVIE NAME : ${serie.title}");
                      return SeriesCard(series: serie);
                    });
              }
            }),
      ),
    );
  }
}
