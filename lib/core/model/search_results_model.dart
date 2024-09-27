import 'dart:convert';

SearchResults searchResultsFromJson(String str) =>
    SearchResults.fromJson(json.decode(str));

String searchResultsToJson(SearchResults data) => json.encode(data.toJson());

class SearchResults {
  String backdropPath;
  int id;
  String originalName;
  String overview;
  String posterPath;
  String mediaType;
  bool adult;
  String name;
  String originalLanguage;
  List<int> genreIds;
  double popularity;
  String firstAirDate;
  double voteAverage;
  int voteCount;
  /* List<String> originCountry; */

  SearchResults({
    required this.backdropPath,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.name,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    /* required this.originCountry, */
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      backdropPath: json["backdrop_path"] ?? "",
      id: json["id"] ?? 0,
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      mediaType: json["media_type"] ?? "",
      adult: json["adult"] ?? false,
      name: json['title'] ?? json['name'],
      originalLanguage: json["original_language"] ?? "",
      genreIds: json["genre_ids"] != null
          ? List<int>.from(json["genre_ids"].map((x) => x))
          : [],
      popularity: json["popularity"]?.toDouble() ?? 0.0,
      firstAirDate: json["first_air_date"] ?? "",
      voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "adult": adult,
        "name": name,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "first_air_date": firstAirDate,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        /* "origin_country": List<dynamic>.from(originCountry.map((x) => x)), */
      };
}
