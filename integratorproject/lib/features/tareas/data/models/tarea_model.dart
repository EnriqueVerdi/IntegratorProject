import 'package:integratorproject/features/tareas/domain/entities/tarea.dart';

class TareaModel extends Tarea {
  TareaModel({required int id, required String titulo, required String descripcion, required estado})
      : super(id: id, titulo: titulo, descripcion: descripcion, estado: estado);

  factory TareaModel.fromJson(Map<String, dynamic> json) {
    return TareaModel(id: json['id'], titulo: json['titulo'], descripcion: json['descripcion'], estado: json['estado']);
  }

  factory TareaModel.fromEntity(Tarea tarea) {
    return TareaModel(
        id: tarea.id, titulo: tarea.titulo, descripcion: tarea.descripcion, estado: tarea.estado);
  }
}
