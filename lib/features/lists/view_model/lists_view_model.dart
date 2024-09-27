import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/model/user_model.dart';

class ListsViewModel {
  Future<void> fetchUserData(String userId,UserModel? usersData) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await firestore.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      usersData = UserModel.fromFirestore(userSnapshot, null);

      // Diğer kullanıcı özelliklerini burada kullanabilirsiniz
    } else {
      debugPrint('Kullanıcı bulunamadı!');
    }
  }
  
}
