import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> postUser();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final String apiURL = "v6bq6y-3000.csb.app";

  @override
  Future<List<UserModel>> getUsers() async {
    //print('DataSource');
    var url = Uri.https(apiURL, '/api/user/get-all');
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

  @override
  Future<UserModel> postUser() async {
    var url = Uri.https(apiURL, '/api/user/register/');
    var response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode({
        'campo' : 'valor'
      }
    ));

    if (response.statusCode == 200) {
      return convert
          .jsonDecode(response.body)
          .map<UserModel>((data) => UserModel.fromJson(data));
    } else {
      throw Exception();
    }
  }

  Future<UserModel> getUser() async {
    var url = Uri.https(apiURL, '/api/user/2');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert
          .jsonDecode(response.body)
          .map<UserModel>((data) => UserModel.fromJson(data));
    } else {
      throw Exception();
    }
  }
}
