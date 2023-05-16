import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tarea.dart';
import '../bloc/tareas_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TareasBloc>().add(GetTareas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        elevation: 0,
        toolbarHeight: 110,
        title: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Mis Tareas',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(220, 255, 255, 255)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/pencil_icon.png'),
            iconSize: 35,
            tooltip: 'Agregar nota',
            onPressed: () {
              createTareaPopUp(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.refresh),
              iconSize: 30,
              color: const Color.fromARGB(220, 255, 255, 255),
              tooltip: 'Actualizar lista',
              onPressed: () async {
                BlocProvider.of<TareasBloc>(context).add(GetTareas());
              },
            ),
          )
        ],
      ),
      body: BlocBuilder<TareasBloc, TareasState>(builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
              child: Column(
                  children: state.tareas.map((tarea) {
                TextEditingController tareaTitle =
                    TextEditingController(text: tarea.title);
                TextEditingController tareaBody =
                    TextEditingController(text: tarea.body);
                return Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 34, 34, 36),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 17, 17, 17),
                        blurRadius: 4.0, // soften the shadow
                        spreadRadius: -1.5, //extend the shadow
                        offset: Offset(
                          0.5,
                          2.5,
                        ),
                      )
                    ],
                  ),
                  child: ListTile(
                    // leading: Text(note.id.toString()),
                    title: Text(
                      tarea.title,
                      style: const TextStyle(
                          color: Color.fromARGB(185, 255, 255, 255),
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      tarea.body,
                      style: const TextStyle(
                          color: Color.fromARGB(140, 255, 255, 255)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      const Color.fromARGB(255, 34, 34, 36),
                                  title: Row(
                                    children: const [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Editar nota',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                  content: SizedBox(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: tareaTitle,
                                          maxLength: 20,
                                          style: const TextStyle(
                                              color: Colors.white70),
                                          decoration: const InputDecoration(
                                            hintText: 'Titulo',
                                            hintStyle: TextStyle(
                                                color: Colors.white38),
                                          ),
                                        ),
                                        TextField(
                                          controller: tareaBody,
                                          maxLength: 80,
                                          style: const TextStyle(
                                              color: Colors.white70),
                                          decoration: const InputDecoration(
                                            hintText: 'Descripción',
                                            hintStyle: TextStyle(
                                                color: Colors.white38),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        var tareaUpdate = Tarea(
                                            id: tarea.id,
                                            title: tareaTitle.text,
                                            body: tareaBody.text);
                                        BlocProvider.of<TareasBlocModify>(
                                                context)
                                            .add(UpdateTarea(tarea: tareaUpdate));
                                        Navigator.of(context).pop();
                                        await Future.delayed(const Duration(
                                                milliseconds: 95))
                                            .then((value) =>
                                                BlocProvider.of<TareasBloc>(
                                                        context)
                                                    .add(GetTareas()));
                                        // BlocProvider.of<NotesBloc>(context)
                                        //     .add(GetNotes());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.deepPurple,
                                        shape: (RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        )),
                                      ),
                                      child: const Text('Actualizar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white70,
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Confirmación',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(
                                      '¿Está seguro de que desea eliminar ${tarea.title}?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Cancelar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color:
                                                Colors.red), // borde del botón
                                        backgroundColor: Colors
                                            .red, // color de fondo del botón
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        'Eliminar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        BlocProvider.of<TareasBlocModify>(
                                                context)
                                            .add(DeleteTarea(tarea: tarea));
                                        Navigator.of(context).pop();
                                        await Future.delayed(const Duration(
                                                milliseconds: 95))
                                            .then((value) =>
                                                BlocProvider.of<TareasBloc>(
                                                        context)
                                                    .add(GetTareas()));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
            ),
          );
        } else if (state is Error) {
          return Center(
            child: Text(state.error, style: const TextStyle(color: Colors.red)),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  createTareaPopUp(BuildContext context) {
    TextEditingController tareaTitle = TextEditingController();
    TextEditingController tareaBody = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 34, 34, 36),
          title: Row(
            children: const [
              Icon(
                Icons.edit,
                color: Colors.white70,
              ),
              SizedBox(width: 10),
              Text(
                'Añadir nota',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 220,
            child: Column(
              children: [
                TextField(
                  controller: tareaTitle,
                  maxLength: 20,
                  style: const TextStyle(color: Colors.white70),
                  decoration: const InputDecoration(
                    hintText: 'Titulo',
                    hintStyle: TextStyle(color: Colors.white38),
                  ),
                ),
                TextField(
                  controller: tareaBody,
                  maxLength: 80,
                  style: const TextStyle(color: Colors.white70),
                  decoration: const InputDecoration(
                    hintText: 'Descripción',
                    hintStyle: TextStyle(color: Colors.white38),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                var tarea =
                    Tarea(id: 0, title: tareaTitle.text, body: tareaBody.text);
                BlocProvider.of<TareasBlocModify>(context)
                    .add(AddTareas(tarea: tarea));
                Navigator.of(context).pop();
                await Future.delayed(const Duration(milliseconds: 95)).then(
                    (value) =>
                        BlocProvider.of<TareasBloc>(context).add(GetTareas()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(220, 255, 255, 255),
                backgroundColor: Colors.deepPurple,
                shape: (RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                )),
              ),
              child: const Text('Crear'),
            ),
          ],
        );
      },
    );
  }
}
