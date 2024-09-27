import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesCategories extends StatelessWidget {
  SeriesCategories({
    super.key,
    required this.seriesDetails,
  });

  SeriesDetails seriesDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 55,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: seriesDetails.genres.length,
            itemBuilder: (context, index) {
              final movieGenre = seriesDetails.genres[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 120,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Constants.appsLighterMainColor),
                  child: Center(
                    child: (movieGenre.name).contains("&")
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              movieGenre.name,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          )
                        : Text(
                            movieGenre.name,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
