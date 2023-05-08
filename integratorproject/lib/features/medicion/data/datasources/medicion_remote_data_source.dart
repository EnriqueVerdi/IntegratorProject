import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:integratorproject/features/medicion/data/models/medicion_model.dart';

abstract class MedicionRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<UserModel>> getMediciones();
}

class MedicionRemoteDataSourceImp implements MedicionRemoteDataSource {
  @override
  Future<List<UserModel>> getMediciones() async {
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
