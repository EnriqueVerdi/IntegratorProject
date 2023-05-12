import 'features/medicion/data/datasources/medicion_remote_data_source.dart';
import 'features/medicion/data/repositories/medicion_repository_impl.dart';
import 'features/medicion/domain/usecases/get_mediciones_usecase.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/usecases/get_users_usecase.dart';

class UsecaseConfig {
  GetUsersUsecase? getUsersUsecase;
  GetMedicionesUsecase? getMedicionesUsecase;
  
  UserRepositoryImpl? userRepositoryImpl;
  UserRemoteDataSourceImp? userRemoteDataSourceImp;  
  MedicionRepositoryImpl? medicionRepositoryImpl;
  MedicionRemoteDataSourceImp? medicionRemoteDataSourceImp;

  UsecaseConfig() {
    getUsersUsecase = GetUsersUsecase(userRepositoryImpl!);
    getMedicionesUsecase = GetMedicionesUsecase(medicionRepositoryImpl!);
    
    medicionRemoteDataSourceImp = MedicionRemoteDataSourceImp();
    medicionRepositoryImpl = MedicionRepositoryImpl(medicionRemoteDataSource: medicionRemoteDataSourceImp!);
    userRemoteDataSourceImp = UserRemoteDataSourceImp();
    userRepositoryImpl = UserRepositoryImpl(userRemoteDataSource: userRemoteDataSourceImp!);
  }
}
