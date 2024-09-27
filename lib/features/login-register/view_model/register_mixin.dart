import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin RegisterMixin<RegisterSection extends StatefulWidget>
    on State<RegisterSection> implements TickerProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordAgainController = TextEditingController();

  String? errorTextForUsername;
  String? errorTextForEmail;

  Future<void> checkUsernameAvailability(String username) async {
    final usersCollection = _firestore.collection('users');
    final querySnapshot =
        await usersCollection.where('username', isEqualTo: username).get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        errorTextForUsername = 'Bu kullanıcı adı zaten kullanımda.';
      });
    } else {
      setState(() {
        errorTextForUsername = null;
      });
    }
  }

  Future<void> checkEmailAvailability(String email) async {
    final usersCollection = _firestore.collection('users');
    final querySnapshot =
        await usersCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        errorTextForEmail = 'Bu e-posta zaten kullanımda.';
      });
    } else {
      setState(() {
        errorTextForEmail = null;
      });
    }
  }
}
