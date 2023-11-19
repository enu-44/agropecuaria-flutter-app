import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/type/animal_type_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/home/components/card_item.dart';
import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadAnimalTypes();
  }

  Future<void> _loadAnimalTypes() async {
    final cubit = context.read<AnimalTypeCubit>();
    await cubit.listTypeAnimals();
  }

  Widget buildLoadedState(List<AnimalTypeEntity> animalTypes) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tipo de Ganado',
        onLogoutPressed: () {
          _signOut();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: animalTypes.length,
          itemBuilder: (context, index) {
            return CustomCard(
              title: animalTypes[index].name,
              count: animalTypes[index].countAnimals,
              imageUrl: animalTypes[index].path,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PageConst.Main,
                  arguments: animalTypes[index],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildFailureState() {
    return const Center(
      child: Text('Error al cargar los tipos de animales'),
    );
  }

  Widget buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalTypeCubit, AnimalTypeState>(
      builder: (context, state) {
        if (state is AnimalTypeListLoaded) {
          return buildLoadedState(state.animalTypes);
        } else if (state is AnimalTypeFailure) {
          return buildFailureState();
        } else {
          return buildLoadingState();
        }
      },
    );
  }

  Future<void> _signOut() async {
    setState(() {});
    BlocProvider.of<AuthCubit>(context).loggedOut().then((value) => {
          Navigator.pushNamedAndRemoveUntil(
              context, PageConst.Splash, (route) => false)
        });
  }
}
