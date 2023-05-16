
import '../entities/tarea.dart';
import '../repositories/tarea_repository.dart';

class DeleteTareaUsecase {
  final TareaRepository tareaRepository;

  DeleteTareaUsecase(this.tareaRepository);

  Future<void> execute(Tarea tarea) async {
    return await tareaRepository.deleteTarea(tarea);
  }
}
