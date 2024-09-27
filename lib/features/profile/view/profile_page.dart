import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/features/login-register/view/login_register_page.dart';
import 'package:movies_and_series_app/features/profile/view/widgets/profile_page_list_tile.dart';
import 'package:movies_and_series_app/services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? username;
  bool isUserSignedIn = false;

  Future<void> getCurrentUser() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where(
            'email',
            isEqualTo: user.email,
          )
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          username = userData['username'];
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    if (user != null) {
      isUserSignedIn = true;
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            user == null
                ? Column(
                    children: [
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.circleExclamation),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Listeler oluşturmak ve yorum yapabilmek için giriş yapmalısınız.",
                                  style: TextStyle(fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA1C9FF)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginRegisterPage();
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Giriş Yap / Kayıt Ol",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Constants.appsMainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Hoşgeldiniz,',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                username == null
                                    ? const SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        '$username',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.gear,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Auth().signOut();
                                    setState(() {
                                      isUserSignedIn = false;
                                    });
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.rightFromBracket,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ProfilePageListTile(
                text: "Bize Yazın", icon: FontAwesomeIcons.envelope),
            ProfilePageListTile(
                text: "Hakkımızda", icon: FontAwesomeIcons.info),
          ],
        ),
      ),
    );
  }
}
