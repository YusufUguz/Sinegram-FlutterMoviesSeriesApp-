import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

// ignore: must_be_immutable
class SeriesProducersInfoCard extends StatelessWidget {
  SeriesProducersInfoCard({super.key, required this.seriesDetails});

  SeriesDetails seriesDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Constants.appsLighterMainColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                FontAwesomeIcons.clapperboard,
                color: Constants.appsMainColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Dizinin Yapımcı Şirketleri",
                          style: TextStyle(
                              fontSize: 20,
                              color: Constants.appsMainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: seriesDetails.productionCompanies.length,
                      itemBuilder: ((context, index) {
                        final productionCompanies =
                            seriesDetails.productionCompanies[index];
                        return Row(
                          children: [
                            productionCompanies.logoPath == ""
                                ? Image.asset(
                                    "assets/icons/movie3.png",
                                    height: 30,
                                    width: 50,
                                  )
                                : Image.network(
                                    "${ApiConfig.imageBaseUrl}${productionCompanies.logoPath}",
                                    width: 50,
                                    height: 30,
                                  ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                productionCompanies.name,
                                style: const TextStyle(
                                    color: Constants.appsMainColor,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
