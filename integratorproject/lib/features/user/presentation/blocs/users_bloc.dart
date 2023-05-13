import 'package:bloc/bloc.dart';
import 'package:integratorproject/features/user/domain/usecases/post_users_usecase.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUsecase getUsersUsecase;
  final PostUsersUsecase postUsersUsecase;

  UsersBloc({required this.getUsersUsecase, required this.postUsersUsecase})
      : super(ShowHome()) {
    on<UsersEvent>((event, emit) async {
      if (event is Login) {
        try {
          emit(Logged());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
