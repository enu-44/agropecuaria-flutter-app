import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_body_screen.dart';
import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  final String name;
  final String code;
  final String sex;
  final String admissionDate;
  final String color;
  final String breed;
  final String imageUrl;

  AnimalCard({
    required this.name,
    required this.code,
    required this.sex,
    required this.admissionDate,
    required this.color,
    required this.breed,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 1,),
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
                      Text('Código: $code'),
                      Text('Sexo: $sex'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Fecha de ingreso:'),
                      Text(admissionDate),
                      Text('Color: $color'),
                      Text('Raza: $breed'),
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
                      MaterialPageRoute(builder: (context) => AnimalBodyScreen(title: 'Editar $name')),
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