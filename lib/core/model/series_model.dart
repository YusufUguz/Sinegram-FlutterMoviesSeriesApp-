class Series {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String wideImagePath;
  final List<dynamic> genreIds;

  Series(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.wideImagePath,
      required this.genreIds});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
        id: json['id'],
        title: json["name"] ?? "",
        overview: json["overview"] ?? "",
        posterPath: json["poster_path"] ?? "",
        voteAverage: json["vote_average"].toDouble() ?? 0.0,
        wideImagePath: json["backdrop_path"] ?? "",
        genreIds: json["genre_ids"]);
  }

  @override
  String toString() {
    return 'Movie{title: $title, id: $id}';
  }
}
