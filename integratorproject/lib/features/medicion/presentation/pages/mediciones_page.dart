import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratorproject/features/medicion/presentation/blocs/mediciones_bloc.dart';

class MedicionesPage extends StatefulWidget {
  const MedicionesPage({super.key});

  @override
  State<MedicionesPage> createState() => _MedicionesPageState();
}

class _MedicionesPageState extends State<MedicionesPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<MedicionesBloc>().add(GetMediciones(id:1)); //acá debería ir el id del usuario
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediciones'),
      ),
      body: BlocBuilder<MedicionesBloc, MedicionesState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return SingleChildScrollView(
              child: Column(
                  children: state.mediciones.map((mediciones) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    child: ListTile(
                      leading: Text(mediciones.id.toString()),
                      title: Text(mediciones.temperature.toString()),
                    ));
              }).toList()),
            );
          } else if (state is Error) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
