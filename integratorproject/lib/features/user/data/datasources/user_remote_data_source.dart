import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<UserModel>> getUsers();
}

class MedicionRemoteDataSourceImp implements UserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    //print('DataSource');
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
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
