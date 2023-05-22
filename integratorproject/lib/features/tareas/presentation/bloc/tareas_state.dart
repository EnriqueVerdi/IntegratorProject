part of 'tareas_bloc.dart';

abstract class TareasState {}

class InitialState extends TareasState {}

class Updating extends TareasState {}

class Updated extends TareasState {}

class Loading extends TareasState {}

class Loaded extends TareasState {
  final List<Tarea> tareas;

  Loaded({required this.tareas});
}

class Error extends TareasState {
  final String error;

  Error({required this.error});
}
