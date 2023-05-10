import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<UserModel>> getUsers();
  Future<List<UserModel>> postUser();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    //print('DataSource');
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts'); //acá se hace la peticion
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
  Future<List<UserModel>> postUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }
}
