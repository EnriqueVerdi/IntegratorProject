import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    var url = Uri(
        scheme: 'http',
        host: '192.168.127.193',
        port: 3000,
        path: '/api/user/get-all');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert
          .jsonDecode(response.body)
          .map<UserModel>((data) => UserModel.fromJson(data))
          .toList();
    } else {
      throw Exception();
    }
  }
}
