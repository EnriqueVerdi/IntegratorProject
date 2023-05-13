part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class ShowHome extends UsersState {}

class Loading extends UsersState {}

class Loaded extends UsersState {
  final List<User> user;
  Loaded({required this.user});
}

class Logged extends UsersState{}

class Error extends UsersState {
  final String error;
  Error({
    required this.error,
  });
}