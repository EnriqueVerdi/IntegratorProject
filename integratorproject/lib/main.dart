import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratorproject/features/medicion/presentation/pages/mediciones_page.dart';
import 'package:integratorproject/features/user/presentation/pages/user_page_home.dart';
import 'package:integratorproject/features/user/presentation/pages/user_page_login.dart';
import 'package:integratorproject/features/user/presentation/pages/user_page_register.dart';
import 'package:integratorproject/usecase_config.dart';

import 'features/medicion/presentation/blocs/mediciones_bloc.dart';
import 'features/user/presentation/blocs/users_bloc.dart';

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
        BlocProvider<MedicionesBloc>(
            create: (BuildContext context) => MedicionesBloc(
                getMedicionesUsecase: usecaseConfig.getMedicionesUsecase!)),
        BlocProvider<UsersBloc>(
            create: (BuildContext context) => UsersBloc(
                getUsersUsecase: usecaseConfig.getUsersUsecase!,
                postUsersUsecase: usecaseConfig.postUsersUsecase!))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserPageHome(),
        routes: {
          '/login': (context) => const UserPageLogin(),
          '/register': (context) => const UserPageRegister(),
          '/profile': (context) => const MedicionesPage(),
        },
      ),
    );
  }
}
