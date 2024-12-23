import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String fullName;
  String email;
  String phoneNu;
  String password;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNu,
    required this.password,
  });
// to push the data to firebase
  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNu,
      "Password": password
    };
  }

// to fetch the data from firebase
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
        final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      phoneNu: data["Phone"],
      password: data["Password"],
    );
  }
}
