class GeneralGenre {
  int id;
  String name;

  GeneralGenre({
    required this.id,
    required this.name,
  });

  factory GeneralGenre.fromJson(Map<String, dynamic> json) => GeneralGenre(
        id: json["id"],
        name: json["name"],
      );
}
