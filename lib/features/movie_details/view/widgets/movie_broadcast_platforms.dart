import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';

// ignore: must_be_immutable
class MovieBroadcastPlatforms extends StatelessWidget {
  MovieBroadcastPlatforms(
      {super.key, required this.buyData, required this.flatrateData});

  List<dynamic> buyData;
  List<dynamic> flatrateData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: buyData.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "${ApiConfig.imageBaseUrl}${buyData[index]['logo_path']}",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        buyData[index]['provider_name'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: flatrateData.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "${ApiConfig.imageBaseUrl}${flatrateData[index]['logo_path']}",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        flatrateData[index]['provider_name'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
