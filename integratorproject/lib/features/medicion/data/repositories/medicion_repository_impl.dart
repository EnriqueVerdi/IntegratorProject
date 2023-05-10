

import '../../domain/entities/medicion.dart';
import '../../domain/repositoriess/medicion_repository.dart';
import '../datasources/medicion_remote_data_source.dart';

class MedicionRepositoryImpl implements MedicionRepository {
  final MedicionRemoteDataSource medicionRemoteDataSource;

  MedicionRepositoryImpl({required this.medicionRemoteDataSource});

  @override
  Future<List<Medicion>> getMediciones() async {
    //print('Repository');
    return await medicionRemoteDataSource.getMediciones();
  }
}