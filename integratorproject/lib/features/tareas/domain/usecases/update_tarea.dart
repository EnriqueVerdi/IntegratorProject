
import '../entities/tarea.dart';
import '../repositories/tarea_repository.dart';

class UpdateTareaUsecase {
  final TareaRepository tareaRepository;

  UpdateTareaUsecase(this.tareaRepository);

  Future<void> execute(Tarea tarea) async {
    return await tareaRepository.updateTarea(tarea);
  }
}
