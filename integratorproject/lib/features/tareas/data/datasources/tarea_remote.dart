import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:integratorproject/features/tareas/data/models/tarea_model.dart';
import 'package:integratorproject/features/tareas/domain/entities/tarea.dart';

String apiURI = ' https://sftonr-3000.csb.app';

abstract class TareaRemoteDataSource {
  Future<List<TareaModel>> getTareas();
  Future<void> addTarea(Tarea tarea);
  Future<void> updateTarea(Tarea tarea);
  Future<void> deleteTarea(Tarea tarea);
}

class TareaRemoteDataSourceImp implements TareaRemoteDataSource {
  @override
  Future<List<TareaModel>> getTareas() async {
    var url = Uri.https(apiURI, '/api/tareas');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert
          .jsonDecode(response.body)
          .map<TareaModel>((data) => TareaModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Error');
    }
  }

  @override
  Future<void> addTarea(Tarea tarea) async {
    var url = Uri.https(apiURI, '/api/tareas');
    var body = {
      'titulo': tarea.titulo,
      'descripcion': tarea.descripcion,
      'estado': tarea.estado
    };
    var headers = {'Content-Type': 'application/json'};
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: headers);

    // print(response.body.toString());
    print('Added');
  }

  @override
  Future<void> updateTarea(Tarea tarea) async {
    var url = Uri.https(apiURI, '/api/note/${tarea.id}');
    var body = {
      'titulo': tarea.titulo,
      'descripcion': tarea.descripcion,
      'estado': tarea.estado
    };
    var headers = {'Content-Type': 'application/json'};
    var response =
        await http.patch(url, body: convert.jsonEncode(body), headers: headers);

    // print(response.body.toString());
    print('Updated');
  }

  @override
  Future<void> deleteTarea(Tarea tarea) async {
    var url = Uri.https(apiURI, '/api/tareas/${tarea.id}');
    var response = await http.delete(url);

    // print(response.body.toString());
    print('Deleted');
  }
}
