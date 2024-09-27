class Movie {
  int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String wideImagePath;
  final List<dynamic> genreIds;
  final String releaseDate;
  final String originalLanguage;
  final double popularity;
  final int voteCount;
  final int budget;
  final String productionCompanies;
  final int revenue;
  final int runtime;
  final String tagline;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.wideImagePath,
      required this.releaseDate,
      required this.genreIds,
      required this.popularity,
      required this.voteCount,
      required this.originalLanguage,
      required this.productionCompanies,
      required this.revenue,
      required this.runtime,
      required this.tagline,
      required this.budget});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['name'] ?? json['title'],
        overview: json["overview"] ?? "",
        posterPath: json["poster_path"] ?? "",
        voteAverage: json["vote_average"] != null
            ? json["vote_average"].toDouble()
            : 0.0,
        wideImagePath: json["backdrop_path"] ?? "",
        genreIds: List<int>.from(json["genre_ids"] ?? []),
        releaseDate: json["release_date"] ?? "",
        originalLanguage: json["original_language"] ?? "",
        popularity: json["popularity"] ?? 0,
        budget: json["budget"] ?? 0,
        productionCompanies: json["production_companies"] ?? "",
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        tagline: json["tagline"] ?? "",
        voteCount: json["vote_count"] ?? 0);
  }

  @override
  String toString() {
    return 'Movie{title: $title, id: $id}';
  }
}
