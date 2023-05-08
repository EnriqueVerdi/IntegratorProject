part of 'mediciones_bloc.dart';

@immutable
abstract class MedicionesState {}

class Loading extends MedicionesState {}

class Loaded extends MedicionesState {
  final List<Medicion> mediciones;
  Loaded({required this.mediciones});
}

class Error extends MedicionesState {
  final String error;
  Error({
    required this.error,
  });
}