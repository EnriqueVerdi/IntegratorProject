import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:integratorproject/features/tareas/data/models/tarea_model.dart';
import 'package:integratorproject/features/tareas/domain/entities/tarea.dart';
import 'package:shared_preferences/shared_preferences.dart';

String apiURL = 'sftonr-3000.csb.app';

abstract class TareaRemoteDataSource {
  Future<List<TareaModel>> getTareas();
  Future<void> addTarea(List<Tarea> tareas);
  Future<void> updateTarea(Tarea tarea);
  Future<void> deleteTarea(Tarea tarea);
}

class TareaRemoteDataSourceImp implements TareaRemoteDataSource {
  @override
  Future<List<TareaModel>> getTareas() async {
    var url = Uri.https(apiURL, '/api/tareas/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var dataTareas = convert
          .jsonDecode(response.body)
          .map<TareaModel>((data) => TareaModel.fromJson(data))
          .toList();
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('tareas', response.body);
      return dataTareas;
    } else {
      throw Exception('Error');
    }
  }

  @override
  Future<void> addTarea(List<Tarea> tareas) async {
    var url = Uri.https(apiURL, '/api/tareas/');
    var headers = {'Content-Type': 'application/json'};

    List<Map<String, Object>> body = [];

    for (var tarea in tareas) {
      var object = {
        'titulo': tarea.titulo,
        'descripcion': tarea.descripcion,
        'estado': tarea.estado
      };

      body.add(object);
    }

    await http.post(url, body: convert.jsonEncode(body), headers: headers);
  }

  @override
  Future<void> updateTarea(Tarea tarea) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('updateTareaOffline')) {
      String? encodedDataCache = prefs.getString('updateTareaOffline');
      prefs.remove('updateTareaOffline');

      if (encodedDataCache != null) {
        List<dynamic> decodedList = json.decode(encodedDataCache);
        List<Map<String, Object>> body = [];

        List<Tarea> tareas =
            decodedList.map((map) => Tarea.fromMap(map)).toList();

        for (var tarea in tareas) {
          var object = {
            'id': tarea.id,
            'titulo': tarea.titulo,
            'descripcion': tarea.descripcion,
            'estado': tarea.estado
          };
          body.add(object);
        }

        print("update offline");
        print(body);

        var url = Uri.https(apiURL, '/api/tareas/multiple');
        var headers = {'Content-Type': 'application/json'};
        await http.put(url, body: convert.jsonEncode(body), headers: headers);
      }
    } else {
      var url = Uri.https(apiURL, '/api/tareas/');
      var body = {
        'id': tarea.id,
        'titulo': tarea.titulo,
        'descripcion': tarea.descripcion,
        'estado': tarea.estado
      };
      print("update");
      print(body);
      
      var headers = {'Content-Type': 'application/json'};
      await http.put(url, body: convert.jsonEncode(body), headers: headers);
    }
  }

  @override
  Future<void> deleteTarea(Tarea tarea) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('deleteTareaOffline')) {
      String? encodedPks = prefs.getString('deleteTareaOffline');
      prefs.remove('deleteTareaOffline');

      if (encodedPks != null) {
        List<dynamic> decodedList = json.decode(encodedPks);
        List<Tarea> tareas =
            decodedList.map((map) => Tarea.fromMap(map)).toList();

        List<int> pks = [];
        for (var tarea in tareas) {
          pks.add(tarea.id);
        }
        var object = {'primary_keys': pks};
        var url = Uri.https(apiURL, '/api/tareas/multiple');
        var headers = {'Content-Type': 'application/json'};
        await http.post(url,
            body: convert.jsonEncode(object), headers: headers);
      }
    } else {
      var url = Uri.https(apiURL, '/api/tareas/${tarea.id}');
      await http.delete(url);
    }
  }
}
