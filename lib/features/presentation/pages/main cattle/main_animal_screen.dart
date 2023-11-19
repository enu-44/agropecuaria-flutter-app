import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/animals_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/type/animal_type_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/card_animal.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_body_screen.dart';
import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAnimalScreen extends StatefulWidget {
  final AnimalTypeEntity data;
  const MainAnimalScreen({super.key, required this.data});

  @override
  State<MainAnimalScreen> createState() => _MainAnimalScreenState();
}

class _MainAnimalScreenState extends State<MainAnimalScreen> {
  @override
  void initState() {
    super.initState();
    _loadAnimals();
  }

  Future<void> _loadAnimals() async {
    final cubit = context.read<AnimalsCubit>();
    await cubit.listAnimalsByType(widget.data.id);
    await context.read<AnimalTypeCubit>().listTypeAnimals();
  }

  Widget buildLoadedState(List<AnimalEntity> animals) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[200],
          child: TextField(
            onChanged: (String value) => context
                .read<AnimalsCubit>()
                .searchAnimals(value, widget.data.id),
            decoration: InputDecoration(
              hintText: 'Buscar...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          child: Text("Mostrando ${animals.length} resultados"),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: animals.length,
            itemBuilder: (context, index) => AnimalCard(animals[index]),
          ),
        ),
      ],
    );
  }

  Widget buildFailureState() {
    return const Center(
      child: Text('Error al cargar los animales'),
    );
  }

  Widget buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.data.name,
        showBackButton: true,
      ),
      body: BlocBuilder<AnimalsCubit, AnimalsState>(
        builder: (context, state) {
          if (state is AnimalListLoaded) {
            return buildLoadedState(state.animals);
          } else if (state is AnimalFailure) {
            return buildFailureState();
          } else {
            return buildLoadingState();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnimalBodyScreen(
                    title: 'Registrar Nuevo', animalTypeId: widget.data.id)),
          ).then((value) {
            if (value is bool) {
              _loadAnimals();
            }
          });
        },
        backgroundColor: Palette.backgroundColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
