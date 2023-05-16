import 'package:integratorproject/features/tareas/domain/entities/tarea.dart';
import 'package:integratorproject/features/tareas/domain/repositories/tarea_repository.dart';

import '../datasources/tarea_remote.dart';


class TareaRepositoryImpl implements TareaRepository {
  final TareaRemoteDataSource tareaRemoteDataSource;

  TareaRepositoryImpl({required this.tareaRemoteDataSource});

  @override
  Future<List<Tarea>> getTareas() async {
    return await tareaRemoteDataSource.getTareas();
  }

  @override
  Future<void> addTarea(Tarea tarea) async {
    return await tareaRemoteDataSource.addTarea(tarea);
  }

  @override
  Future<void> updateTarea(Tarea tarea) async {
    return await tareaRemoteDataSource.updateTarea(tarea);
  }

  @override
  Future<void> deleteTarea(Tarea tarea) async {
    return await tareaRemoteDataSource.deleteTarea(tarea);
  }
}
