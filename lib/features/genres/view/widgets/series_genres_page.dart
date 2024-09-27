import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/genres/view/widgets/genre_card.dart';
import 'package:movies_and_series_app/features/genres/view_model/genres_view_model.dart';
import 'package:movies_and_series_app/features/series_by_genre/series_by_genre.dart';
import 'package:movies_and_series_app/core/model/genre_model.dart';
import 'package:movies_and_series_app/core/general_widgets/loader.dart';

class SeriesGenresPage extends StatefulWidget {
  const SeriesGenresPage({super.key});

  @override
  State<SeriesGenresPage> createState() => _SeriesGenresPageState();
}

class _SeriesGenresPageState extends State<SeriesGenresPage> {
  List<GeneralGenre> genres = [];
  List<int> selectedGenreIds = [];
  String selectedGenreName = "";

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    try {
      final List<GeneralGenre> fetchedGenres =
          await GenresViewModel.fetchSeriesGenres();
      final List<String> excludedGenres = [
        'Aile',
        'Haber',
        'Gerçeklik',
        'Pembe Dizi',
      ];
      setState(() {
        final List<GeneralGenre> filteredGenres = fetchedGenres.where((genre) {
          return !excludedGenres.contains(genre.name);
        }).toList();
        genres.clear();
        genres.addAll(filteredGenres);
      });
    } catch (e) {
      debugPrint('Error fetching genres: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return genres.isEmpty
        ? const Loader()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                scrollDirection: Axis.vertical,
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedGenreIds.contains(genre.id)) {
                          selectedGenreIds.remove(genre.id);
                        } else {
                          selectedGenreIds.add(genre.id);
                          selectedGenreName = genre.name;
                        }
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeriesByGenre(
                            selectedGenreIds: selectedGenreIds,
                            selectedGenreName: selectedGenreName,
                          ),
                        ),
                      );
                    },
                    child: GenreCard(
                      genre: genre,
                      genreType: "Series",
                    ),
                  );
                },
              ),
            ),
          );
  }
}
