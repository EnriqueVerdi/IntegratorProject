import 'package:integratorproject/usercase_config.dart';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/tareas/presentation/bloc/tareas_bloc.dart';
import 'features/tareas/presentation/pages/tareas_page.dart';


UsecaseConfig usecaseConfig = UsecaseConfig();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TareasBloc>(
            create: (BuildContext context) =>
                TareasBloc(getTareasUsecase: usecaseConfig.getTareasUsecase!)),
        BlocProvider<TareasBlocModify>(
          create: (BuildContext context) => TareasBlocModify(
              addTareaUsecase: usecaseConfig.addTareaUsecase!,
              updateTareaUsecase: usecaseConfig.updateTareaUsecase!,
              deleteTareaUsecase: usecaseConfig.deleteTareaUsecase!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const PostsPage(),
      ),
    );
  }
}
