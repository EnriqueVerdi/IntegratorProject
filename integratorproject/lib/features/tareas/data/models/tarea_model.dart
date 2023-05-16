import 'package:integratorproject/features/tareas/domain/entities/tarea.dart';

class TareaModel extends Tarea {
  TareaModel({required int id, required String title, required String body})
      : super(id: id, titulo: title, descripcion: body);

  factory TareaModel.fromJson(Map<String, dynamic> json) {
    return TareaModel(id: json['id'], title: json['title'], body: json['body']);
  }

  factory TareaModel.fromEntity(Tarea tarea) {
    return TareaModel(
        id: tarea.id, title: tarea.titulo, body: tarea.descripcion);
  }
}
