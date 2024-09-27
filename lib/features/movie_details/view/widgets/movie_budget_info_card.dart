import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';

// ignore: must_be_immutable
class BudgetInfoCard extends StatelessWidget {
  BudgetInfoCard({
    super.key,
    required this.movieDetails,
  });

  MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: const Color.fromARGB(255, 34, 41, 44),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.dollarSign,
                color: Constants.appsLighterMainColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Bu filmin yapımında ${movieDetails.budget} \$ harcanmıştır.",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
