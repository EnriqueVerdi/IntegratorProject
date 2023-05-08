import '../../domain/entities/medicion.dart';

class UserModel extends Medicion {
  UserModel({required int id, required int userId})
      : super(id: id, userId: userId);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], userId: json['userId']);
  }

  factory UserModel.fromEntity(Medicion medicion) {
    return UserModel(id: medicion.id, userId: medicion.userId);
  }
}
