import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required int id,
      required String name,
      required String lastname,
      required String email,
      required String dayBirth,
      required String nss,
      required String sex,
      required int age,
      required double height,
      required double weight,
      required String phone,
      required String ePhone,
      required String adress,
      required String nameMedic,
      required String hospital,
      required String password})
      : super(
            id: id,
            name: name,
            lastname: lastname,
            email: email,
            dayBirth: dayBirth,
            nss: nss,
            sex: sex,
            age: age,
            height: height,
            weight: weight,
            phone: phone,
            ePhone: ePhone,
            adress: adress,
            nameMedic: nameMedic,
            hospital: hospital,
            password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        email: json['email'],
        dayBirth: json['dayBirth'],
        nss: json['nss'],
        sex: json['sex'],
        age: json['age'],
        height: json['height'],
        weight: json['weight'],
        phone: json['phone'],
        ePhone: json['ePhone'],
        adress: json['adress'],
        nameMedic: json['nameMedic'],
        hospital: json['hospital'],
        password: json['password']);
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
        id: user.id,
        name: user.name,
        lastname: user.lastname,
        email: user.email,
        dayBirth: user.dayBirth,
        nss: user.nss,
        sex: user.sex,
        age: user.age,
        height: user.height,
        weight: user.weight,
        phone: user.phone,
        ePhone: user.ePhone,
        adress: user.adress,
        nameMedic: user.nameMedic,
        hospital: user.hospital,
        password: user.password);
  }
}