import 'features/tareas/domain/usecases/add_tarea.dart';
import 'features/tareas/domain/usecases/delete_tarea.dart';
import 'features/tareas/domain/usecases/get_tareas.dart';
import 'features/tareas/domain/usecases/update_tarea.dart';
import 'features/tareas/data/datasources/tarea_remote.dart';
import 'features/tareas/data/repositories/tarea_repository_impl.dart';

class UsecaseConfig {
  GetTareasUsecase? getTareasUsecase;
  AddTareaUsecase? addTareaUsecase;
  UpdateTareaUsecase? updateTareaUsecase;
  DeleteTareaUsecase? deleteTareaUsecase;
  TareaRepositoryImpl? tareaRepositoryImpl;
  TareaRemoteDataSourceImp? tareaRemoteDataSourceImp;

  UsecaseConfig() {
    tareaRemoteDataSourceImp = TareaRemoteDataSourceImp();
    tareaRepositoryImpl =
        TareaRepositoryImpl(tareaRemoteDataSource: tareaRemoteDataSourceImp!);
    getTareasUsecase = GetTareasUsecase(tareaRepositoryImpl!);
    addTareaUsecase = AddTareaUsecase(tareaRepositoryImpl!);
    updateTareaUsecase = UpdateTareaUsecase(tareaRepositoryImpl!);
    deleteTareaUsecase = DeleteTareaUsecase(tareaRepositoryImpl!);
  }
}
