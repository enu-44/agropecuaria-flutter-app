import 'dart:typed_data';

import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_body_screen.dart';
import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  final String name;
  final String code;
  final String sex;
  final DateTime admissionDate;
  final String color;
  final String breed;
  final Uint8List? imageUrl;
  final int animalTypeId;

  AnimalCard({
    required this.name,
    required this.code,
    required this.sex,
    required this.admissionDate,
    required this.color,
    required this.breed,
    required this.imageUrl,
    required this.animalTypeId
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        //padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if(imageUrl != null)
              SizedBox(
                width: 70,
                height: 70,
                child: Image.memory(imageUrl!, fit: BoxFit.cover,),
              
              ),
            const SizedBox(width: 5,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Nombre:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(name),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Código:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(code),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Sexo:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(sex),
                        ],
                      ),
                       
                       Row(
                        children: [
                          const Text('Color:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(color),
                        ],
                      ),
                       Row(
                        children: [
                          const Text('Raza:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(breed),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Fecha de ingreso:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('${admissionDate.day}/${admissionDate.month}/${admissionDate.year} - ${admissionDate.hour}:${admissionDate.minute}'),
                        ],
                      ),
                      const SizedBox(height: 10.0,)
                    ],
                  ),
                  
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'editar') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AnimalBodyScreen(title: 'Editar $name', animalTypeId: animalTypeId,)),
                    );
                } else if (value == 'eliminar') {
                  // Lógica para eliminar
                  print('Eliminar: $name');
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