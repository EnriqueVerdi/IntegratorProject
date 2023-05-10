

import '../entities/medicion.dart';
import '../repositoriess/medicion_repository.dart';

class GetMedicionesUsecase {
  final MedicionRepository repository;

  GetMedicionesUsecase(this.repository);
  Future<List<Medicion>> execute(int id) async {
    return await repository.getMediciones(id);
  }

}