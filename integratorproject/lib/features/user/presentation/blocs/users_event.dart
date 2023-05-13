part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class Login extends UsersEvent{}

class GetUsers extends UsersEvent {}

