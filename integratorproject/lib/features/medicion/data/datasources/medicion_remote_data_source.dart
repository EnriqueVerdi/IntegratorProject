import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:integratorproject/features/medicion/data/models/medicion_model.dart';

abstract class MedicionRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<MedicionModel>> getMediciones(int id);
}

class MedicionRemoteDataSourceImp implements MedicionRemoteDataSource {
  final String apiURL = "v6bq6y-3000.csb.app";

  @override
  Future<List<MedicionModel>> getMediciones(int id) async {
    var url = Uri.https(apiURL, '/api/mediciones/get/$id');
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
