
part of 'mediciones_bloc.dart';


@immutable
abstract class MedicionesEvent {}

class GetMediciones extends MedicionesEvent{
  final int id;

  GetMediciones({required this.id});
}