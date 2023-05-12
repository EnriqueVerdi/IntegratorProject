// import 'package:actividad1/pages/login.dart';
// import 'package:actividad1/pages/register.dart';
// import 'package:actividad1/services/firebase_auth_methods.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integratorproject/features/user/presentation/pages/user_page_login.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      // padding: const EdgeInsets.symmetric(horizontal: 24),
      width: size.width,
      height: size.height,
      // decoration: const BoxDecoration(color: Color(0xffffffff)),
      child: Container(
        // padding: const EdgeInsets.only(right: 10, left: 8),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstrains) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstrains.maxHeight,
                ),
                child: Container(
                  color:const Color(0xffFF3941),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: TextButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UserPageLogin()),
                                      )
                                    },
                                    child: const Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}