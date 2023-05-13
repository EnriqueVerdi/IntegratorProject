// import 'package:actividad1/api/apiAuth.dart';
// import 'package:actividad1/pages/forgot_password.dart';
// import 'package:actividad1/pages/menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratorproject/features/medicion/presentation/blocs/mediciones_bloc.dart';
import 'package:integratorproject/features/user/presentation/blocs/users_bloc.dart';
// import 'package:logger/logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../models/user_model.dart';
// import 'package:actividad1/services/login_interface.dart';
// import 'package:actividad1/services/login_service.dart';

class UserPageLogin extends StatefulWidget {
  const UserPageLogin({Key? key}) : super(key: key);

  @override
  State<UserPageLogin> createState() => _UserPageLoginState();
}

class _UserPageLoginState extends State<UserPageLogin> {
  // final ILogin loginService = LoginService();
  bool _isObscure = true;
  String email = "";
  // TextEditingController email =
  String password = "";
  // final ApiAuth apiAuth = ApiAuth();
  // final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    final medicionesBloc = BlocProvider.of<MedicionesBloc>(context);
    
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          // backgroundColor: Colors.deepPurple,
          backgroundColor: const Color(0xffFF3941),
          title: Row(
            children: const [
              SizedBox(width: 10),
              Text('Iniciar sesión'),
              // Spacer(),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Image(
              //     image: AssetImage('assets/images/splash2.png'),
              //     height: 30,
              //   ),
              // ),
            ],
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          child: const Text(
                            'Inicia sesión con tu cuenta para continuar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          margin: const EdgeInsets.only(right: 190),
                          child: const Text(
                            'Correo electrónico',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 15),
                            autofocus: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              hintText: 'Correo electrónico',
                            ),
                            onChanged: (text) {
                              email = text;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          margin: const EdgeInsets.only(right: 250, left: 10),
                          child: const Text(
                            'Contraseña',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            obscureText: _isObscure,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 15),
                            autofocus: true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              hintText: 'Contraseña',
                            ),
                            onChanged: (text) {
                              password = text;
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: size.width - 70,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                  // UserModel? user = await loginService.login(email, password);

                                  // String respuesta =
                                  //     await apiAuth.login(email, password);
                                  // int idUser = respuesta.indexOf('userId');
                                  // SharedPreferences prefs =
                                  //     await SharedPreferences.getInstance();
                                  // if (prefs.getBool('code') == true) {
                                  //   Navigator.pushNamed(
                                  //       context, 'change_password');
                                  // }
                                  // await showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) =>
                                  //         AlertDialog(
                                  //           title: const Text(
                                  //               'Información del usuario'),
                                  //           content: Text(respuesta),
                                  //           actions: [
                                  //             TextButton(
                                  //                 onPressed: () {
                                  //                   Navigator.pop(context);
                                  //                 },
                                  //                 child: const Text('Cancelar'))
                                  //           ],
                                  //         ));
                                  medicionesBloc.add(GetMediciones(id: 1));
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text(
                                                'Información del usuario'),
                                            content: const Text("text"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/profile');
                                                  },
                                                  child: const Text('Cerrar'))
                                            ],
                                          ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFF3941),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: const Text(
                                  'Ingresar',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 35, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                maxLines: 2,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "¿Aún no tienes cuenta? ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "Registrate",
                                      style: const TextStyle(
                                          color: Color(0xffFF3941)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .pushNamed('/register');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
