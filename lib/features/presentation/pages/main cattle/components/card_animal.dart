import 'dart:io';
import 'dart:typed_data';

import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/animals_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/type/animal_type_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_body_screen.dart';
import 'package:agropecuariosapp/features/presentation/widgets/toast_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnimalCard extends StatelessWidget {
  final AnimalEntity data;
  AnimalCard(this.data);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (data.photoPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.file(
                  File(data.photoPath!),
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.contain,
                ),
              ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,                    children: [
                Row(
                  children: [
                    const Text('Nombre:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Flexible(child: Text(data.name,overflow: TextOverflow.ellipsis)),
                  ],
                ),
                Row(
                  children: [
                    const Text('Código:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data.code),
                  ],
                ),

                Row(
                  children: [
                    const Text('Color:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Flexible(child: Text(data.color, overflow: TextOverflow.ellipsis)),
                  ],
                ),
                Row(
                  children: [
                    const Text('Sexo:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data.sexo),
                  ],
                ),
                Row(
                  children: [
                    const Text('Raza:',
                        style: TextStyle(fontWeight: FontWeight.bold),

                    ),
                    Flexible(
                      child: Text(data.race, 
                        overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Fecha:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        '${data.createdDate.day}/${data.createdDate.month}/${data.createdDate.year} - ${data.createdDate.hour}:${data.createdDate.minute}'),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                )
              ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'editar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimalBodyScreen(
                              data: data,
                              title: 'Editar ${data.name}',
                              animalTypeId: data.animalTypeId,
                            )),
                  ).then((value) async {
                    if (value is bool) {
                      final cubit = context.read<AnimalsCubit>();
                      await cubit.delete(data.id);
                      await cubit.listAnimalsByType(data.animalTypeId);
                      // ignore: use_build_context_synchronously
                      await context.read<AnimalTypeCubit>().listTypeAnimals();
                    }
                  });
                } else if (value == 'eliminar') {
                  ToastConfirm.showToastConfirm(FToast().init(context),
                      onConfirm: () async {
                    final cubit = context.read<AnimalsCubit>();
                    await cubit.delete(data.id);
                    await cubit.listAnimalsByType(data.animalTypeId);
                    // ignore: use_build_context_synchronously
                    await context.read<AnimalTypeCubit>().listTypeAnimals();
                  });
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'editar',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Editar'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'eliminar',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Eliminar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
