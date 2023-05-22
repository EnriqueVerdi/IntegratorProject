
import '../entities/tarea.dart';
import '../repositories/tarea_repository.dart';

class AddTareaUsecase {
  final TareaRepository tareaRepository;

  AddTareaUsecase(this.tareaRepository);

  Future<void> execute(List<Tarea> tarea) async {
    return await tareaRepository.addTarea(tarea);
  }
}
