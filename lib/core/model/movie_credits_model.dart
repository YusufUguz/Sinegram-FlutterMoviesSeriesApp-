import 'dart:convert';

MovieCredits movieCreditsFromJson(String str) =>
    MovieCredits.fromJson(json.decode(str));

String movieCreditsToJson(MovieCredits data) => json.encode(data.toJson());

class MovieCredits {
  int id;
  String knownForDepartment;
  String name;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;

  MovieCredits({
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
  });

  factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
        id: json["id"],
        knownForDepartment: json["known_for_department"] ?? "",
        name: json["name"] ?? "",
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        profilePath: json["profile_path"] ?? "",
        castId: json["cast_id"] ?? 0,
        character: json["character"] ?? "",
        creditId: json["credit_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
      };
}
