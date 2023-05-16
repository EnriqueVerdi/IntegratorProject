import 'package:integratorproject/features/tareas/domain/entities/tarea.dart';

abstract class TareaRepository {
  Future<List<Tarea>> getTareas();
  Future<void> addTarea(Tarea tarea);
  Future<void> updateTarea(Tarea tarea);
  Future<void> deleteTarea(Tarea tarea);
}
