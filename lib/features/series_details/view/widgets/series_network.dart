import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

class SeriesNetwork extends StatelessWidget {
  const SeriesNetwork({
    super.key,
    required this.seriesDetails,
  });

  final SeriesDetails seriesDetails;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: seriesDetails.networks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Network network = seriesDetails.networks[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: const Color.fromARGB(255, 34, 41, 44),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "${ApiConfig.imageBaseUrl}${network.logoPath}",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    network.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
