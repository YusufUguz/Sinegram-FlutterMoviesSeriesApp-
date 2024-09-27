import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/core/model/series_details_model.dart';

class SeriesImageArea extends StatefulWidget {
  const SeriesImageArea({
    super.key,
    required this.seriesDetails,
  });

  final SeriesDetails seriesDetails;

  @override
  State<SeriesImageArea> createState() => _SeriesImageAreaState();
}

class _SeriesImageAreaState extends State<SeriesImageArea> {
  final user = FirebaseAuth.instance.currentUser;

  bool isFavorite = false;

  Future<bool> checkFavorite(int movieID) async {
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      final List<dynamic> favorites = userDoc.data()?['Favori Dizilerim'] ?? [];
      return favorites.contains(movieID);
    } else {
      return false;
    }
  }

  Future<void> addToFavorites(int movieID) async {
    if (user != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);

      await userDoc.update({
        'Favori Dizilerim': FieldValue.arrayUnion([movieID])
      });
    } else {
      // Handle the case when the user is not signed in
    }
  }

  Future<void> removeFromFavorites(int movieID) async {
    if (user != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);

      await userDoc.update({
        'Favori Dizilerim': FieldValue.arrayRemove([movieID])
      });
    } else {
      // Handle the case when the user is not signed in
    }
  }

  @override
  void initState() {
    super.initState();
    checkFavorite(widget.seriesDetails.id).then(
      (value) {
        setState(() {
          isFavorite = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
          image: DecorationImage(
              image: NetworkImage(
                  "${ApiConfig.imageBaseUrl}${widget.seriesDetails.backdropPath}"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.seriesDetails.name.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Chip(
                    label: Text(
                      (widget.seriesDetails.voteAverage).toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    avatar: const Icon(
                      FontAwesomeIcons.solidStar,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  if (user == null) {
                    Fluttertoast.showToast(
                        msg: "Favorilere kaydetmek için giriş yapmalısınız.",
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 18);
                  } else {
                    if (isFavorite == false) {
                      const snackBar = SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          '"Favori Dizilerim" listesine eklendi.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                      addToFavorites(widget.seriesDetails.id).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                      setState(() {
                        isFavorite = true;
                      });
                    } else if (isFavorite == true) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Favorilerimden Kaldır",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                "Diziyi Favori Dizilerim listesinden kaldırmak istediğinize emin misiniz?",
                                style: TextStyle(fontSize: 17),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Hayır"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    const snackBar = SnackBar(
                                      backgroundColor: Colors.black,
                                      content: Text(
                                        'Dizi "Favori Dizilerim" listesinden kaldırıldı.',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    );
                                    removeFromFavorites(widget.seriesDetails.id)
                                        .then((value) {
                                      setState(() {
                                        isFavorite = false;
                                      });
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Evet"),
                                ),
                              ],
                            );
                          });
                    }
                  }
                },
                icon: Icon(
                  isFavorite == true
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  size: 27,
                  color: Constants.appsLighterMainColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.bookmark,
                  size: 27,
                  color: Constants.appsLighterMainColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
