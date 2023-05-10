import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:integratorproject/features/medicion/data/models/medicion_model.dart';

abstract class MedicionRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<MedicionModel>> getMediciones();
}

class MedicionRemoteDataSourceImp implements MedicionRemoteDataSource {
  @override
  Future<List<MedicionModel>> getMediciones() async {
    //print('DataSource');
    var urlGet = '192.168.0.21:3000/api/mediciones/get';
    var url = Uri(
        scheme: 'http',
        host: '192.168.0.21',
        port: 3000,
        path: '/api/mediciones/get');
    // var url = Uri.http('192.168.0.21:3000','/api/mediciones/get');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert
          .jsonDecode(response.body)
          .map<MedicionModel>((data) => MedicionModel.fromJson(data))
          .toList();
    } else {
      throw Exception();
    }
  }
}
