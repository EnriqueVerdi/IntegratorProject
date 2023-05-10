
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/usecases/get_users_usecase.dart';

class UsecaseConfig {
  GetUsersUsecase? getUsersUsecase;
  UserRepositoryImpl? userRepositoryImpl;
  UserRemoteDataSourceImp? userRemoteDataSourceImp;

  UsecaseConfig() {
    userRemoteDataSourceImp = UserRemoteDataSourceImp();
    userRepositoryImpl = UserRepositoryImpl(userRemoteDataSource: userRemoteDataSourceImp!);
    getUsersUsecase = GetUsersUsecase(userRepositoryImpl!);
  }
}