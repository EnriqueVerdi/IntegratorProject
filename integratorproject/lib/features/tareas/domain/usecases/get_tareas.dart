
import '../entities/tarea.dart';
import '../repositories/tarea_repository.dart';

class GetTareasUsecase {
  final TareaRepository tareaRepository;

  GetTareasUsecase(this.tareaRepository);

  Future<List<Tarea>> execute() async {
    return await tareaRepository.getTareas();
  }
}
