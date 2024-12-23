import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? id;
  String text;
  String senderId;
  DateTime time;

  MessageModel({
    this.id,
    required this.text,
    required this.senderId,
    required this.time,
  });
// to push the data to firebase
  toJson() {
    return {
      "Text": text,
      "SenderID": senderId,
      "Time": time.toIso8601String(),
    };
  }

// to fetch the data from firebase
  factory MessageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MessageModel(
        id: document.id,
        text: data["Text"],
        senderId: data["SenderID"],
        time: data["Time"]);
  }
}
