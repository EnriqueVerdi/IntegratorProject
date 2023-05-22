import 'dart:async';
import 'dart:convert' as convert;

import 'package:bloc/bloc.dart';
import 'package:integratorproject/features/tareas/data/models/tarea_model.dart';
import 'package:integratorproject/features/tareas/domain/usecases/get_tareas.dart';
import 'package:integratorproject/features/tareas/domain/usecases/add_tarea.dart';
import 'package:integratorproject/features/tareas/domain/usecases/update_tarea.dart';
import 'package:integratorproject/features/tareas/domain/usecases/delete_tarea.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/tarea.dart';

part 'tareas_event.dart';
part 'tareas_state.dart';

class TareasBloc extends Bloc<TareasEvent, TareasState> {
  final GetTareasUsecase getTareasUsecase;

  TareasBloc({required this.getTareasUsecase}) : super(Loading()) {
    on<TareasEvent>((event, emit) async {
      if (event is GetTareas) {
        try {
          emit(Loading());
          List<Tarea> response = await getTareasUsecase.execute();
          emit(Loaded(tareas: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is GetTareasOffline) {
        try {
          emit(Loading());
          final prefs = await SharedPreferences.getInstance();
          String? userDataStr = prefs.getString('tareas');
          if (userDataStr != null) {
            var returnData = convert
                .jsonDecode(userDataStr)
                .map<TareaModel>((data) => TareaModel.fromJson(data))
                .toList();
            emit(Loaded(tareas: returnData));
          }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}

class TareasBlocModify extends Bloc<TareasEvent, TareasState> {
  final AddTareaUsecase addTareaUsecase;
  final UpdateTareaUsecase updateTareaUsecase;
  final DeleteTareaUsecase deleteTareaUsecase;

  TareasBlocModify(
      {required this.addTareaUsecase,
      required this.updateTareaUsecase,
      required this.deleteTareaUsecase})
      : super(Updating()) {
    on<TareasEvent>((event, emit) async {
      if (event is AddTareas) {
        try {
          emit(Updating());
          await addTareaUsecase.execute(event.tareas);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is UpdateTarea) {
        try {
          emit(Updating());
          await updateTareaUsecase.execute(event.tarea);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is DeleteTarea) {
        try {
          emit(Updating());
          await deleteTareaUsecase.execute(event.tarea);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
