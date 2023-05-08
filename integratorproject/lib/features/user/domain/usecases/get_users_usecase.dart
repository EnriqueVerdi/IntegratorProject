


import '../entities/user.dart';
import '../repositoriess/user_repository.dart';

class GetUsersUsecase {
  final UserRepository repository;

  GetUsersUsecase(this.repository);

  Future<List<User>> execute() async {
    return await repository.getUsers();
  }

}