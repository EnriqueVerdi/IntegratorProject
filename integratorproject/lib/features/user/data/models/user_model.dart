

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String name
  }) : super(id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name']
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name
    );
  }
}