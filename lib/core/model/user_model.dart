// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? username;
  String? password;
  Map<String, int>? lists;
  UserModel({
    this.email,
    this.username,
    this.password,
    this.lists,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    Map<String, int>? listsMap;

    if (data?["lists"] != null) {
      final dynamicMap = data?["lists"] as Map<String, dynamic>;
      listsMap = {};
      dynamicMap.forEach((key, value) {
        if (value is List<dynamic>) {
          final sum = value
              .cast<int>()
              .fold(0, (previous, current) => previous + current);
          listsMap![key] = sum;
        }
      });
    }

    return UserModel(
      email: data?["email"] ?? "",
      password: data?["password"] ?? "",
      username: data?["username"] ?? "",
      lists: listsMap,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (username != null) "username": username,
      if (password != null) "password": password,
      if (email != null) "email": email,
      if (lists != null) "lists": lists,
    };
  }
}
