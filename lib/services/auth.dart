import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_and_series_app/core/general_widgets/navigation_bar_page.dart';

class Auth {
  final firebaseAuth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    final UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    // ignore: use_build_context_synchronously
    final navigator = Navigator.of(context);

    try {
      if (userCredential.user != null) {
        navigator.pushReplacement(MaterialPageRoute(builder: (context) {
          return const MainPage();
        }));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        await _createUser(
          uid: uid,
          username: username,
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _createUser({
    required String username,
    required String email,
    required String password,
    required String uid,
  }) async {
    await userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'password': password,
    });
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
