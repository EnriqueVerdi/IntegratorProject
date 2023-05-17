import 'package:integratorproject/usercase_config.dart';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/tareas/presentation/bloc/tareas_bloc.dart';
import 'features/tareas/presentation/pages/tareas_page.dart';

MaterialColor indigoDye = const MaterialColor(
  0xFF27496D,
  <int, Color>{
    50: Color(0xFFE6E9F1),
    100: Color(0xFFB3BBCB),
    200: Color(0xFF808AA5),
    300: Color(0xFF4D5760),
    400: Color(0xFF39444F),
    500: Color(0xFF27496D),
    600: Color(0xFF223E62),
    700: Color(0xFF1C3458),
    800: Color(0xFF162B4E),
    900: Color(0xFF0D1A3D),
  },
);

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
          primarySwatch: indigoDye,
        ),
        home: const PostsPage(),
      ),
    );
  }
}
