// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_test2/src/auth/models/user_model.dart';

class ChatModel {
  String id;
  List<UserModel> users = [];
  List chat = [];
  List usersId = [];
  ChatModel({
    required this.id,
    required this.users,
    required this.chat,
    required this.usersId,
  });

  ChatModel.fromJson(map)
      : this(
            id: map['id'],
            users: map['users']
                .map<UserModel>((e) => UserModel.fromSnapshot(e))
                .toList(),
            chat: map['chat'],
            usersId: map['users_id']);

  toJson() {
    return {'id': id, 'users': users, 'chat': chat, 'users_id': usersId};
  }
}
