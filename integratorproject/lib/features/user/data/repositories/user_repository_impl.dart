import '../../domain/entities/user.dart';
import '../../domain/repositoriess/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<List<User>> getUsers() async {
    return await userRemoteDataSource.getUsers();
  }

  @override
  Future<User> postUsers() async {
    return await userRemoteDataSource.postUser();
  }
}
