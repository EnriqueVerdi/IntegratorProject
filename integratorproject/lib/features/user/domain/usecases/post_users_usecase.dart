import '../entities/user.dart';
import '../repositoriess/user_repository.dart';

class PostUsersUsecase {
  final UserRepository repository;

  PostUsersUsecase(this.repository);

  Future<User> execute() async {
    return await repository.postUsers();
  }
}
