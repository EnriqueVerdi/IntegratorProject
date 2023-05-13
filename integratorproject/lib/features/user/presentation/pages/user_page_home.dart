// import 'package:actividad1/pages/login.dart';
// import 'package:actividad1/pages/register.dart';
// import 'package:actividad1/services/firebase_auth_methods.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratorproject/features/user/presentation/blocs/users_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:integratorproject/features/user/presentation/blocs/users_bloc.dart';
// import 'package:integratorproject/features/user/presentation/pages/user_page_login.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:actividad1/services/firebase_services.dart';
// import 'package:actividad1/datos/home_screen_google.dart';
// import 'package:actividad1/datos/home_screen_facebook.dart';

class UserPageHome extends StatefulWidget {
  const UserPageHome({Key? key}) : super(key: key);

  @override
  State<UserPageHome> createState() => _UserPageHomeState();
}

class _UserPageHomeState extends State<UserPageHome> {
  @override
  Widget build(BuildContext context) {
    final usersBloc = BlocProvider.of<UsersBloc>(context);
    
    Future.delayed(const Duration(seconds: 3)).then((_) {
      usersBloc.add(Login());
      Navigator.of(context).pushNamed('/login');
    });

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstrains.maxHeight,
              ),
              child: Container(
                color: const Color(0xffFF3941),
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'Vitality',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 20),
                    //   width: 300,
                    //   child: Image.asset('assets/images/splash2.png'),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'MOD',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
