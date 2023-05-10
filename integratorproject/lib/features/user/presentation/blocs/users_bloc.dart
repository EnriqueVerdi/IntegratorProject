import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUsecase getUsersUsecase;
  UsersBloc({
    required this.getUsersUsecase,
  }) : super(Loading()) {
    on<UsersEvent>((event, emit) async {
      if (event is GetUsers) {
        try {
          List<User> response = await getUsersUsecase.execute();
          emit(Loaded(user: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
