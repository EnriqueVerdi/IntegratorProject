part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class Loading extends UsersState {}

class Loaded extends UsersState {
  final List<User> user;
  Loaded({required this.user});
}

class Error extends UsersState {
  final String error;
  Error({
    required this.error,
  });
}