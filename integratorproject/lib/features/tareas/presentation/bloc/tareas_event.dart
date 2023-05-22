part of 'tareas_bloc.dart';

abstract class TareasEvent {}

class GetTareas extends TareasEvent {}

class GetTareasOffline extends TareasEvent {}

class AddTareas extends TareasEvent {
  final List<Tarea> tareas;

  AddTareas({required this.tareas});
}

class UpdateTarea extends TareasEvent {
  final Tarea tarea;

  UpdateTarea({required this.tarea});
}

class DeleteTarea extends TareasEvent {
  final Tarea tarea;

  DeleteTarea({required this.tarea});
}
