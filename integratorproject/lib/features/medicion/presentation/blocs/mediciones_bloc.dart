import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/medicion.dart';
import '../../domain/usecases/get_mediciones_usecase.dart';

part  'mediciones_event.dart';
part 'mediciones_state.dart';

class MedicionesBloc extends Bloc<MedicionesEvent, MedicionesState> {
 
  final GetMedicionesUsecase getMedicionesUsecase;
  
   MedicionesBloc({required this.getMedicionesUsecase}) : super(Loading()){
    on<MedicionesEvent>((event, emit) async {
      if (event is GetMediciones) {
        try{
          List<Medicion> response = await getMedicionesUsecase.execute(event.id);
          emit(Loaded(mediciones: response));
        }catch(e){
          emit(Error(error: e.toString()));
          print(e.toString());
        }
      }
    });
  }

}


