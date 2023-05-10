import '../entities/medicion.dart';

abstract class MedicionRepository{
  Future<List<Medicion>> getMediciones();
}