import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/card_animal.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_body_screen.dart';
import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MainAnimalScreen extends StatefulWidget {
  final String title;
  const MainAnimalScreen({super.key, required this.title});

  @override
  State<MainAnimalScreen> createState() => _MainAnimalScreenState();
}

class _MainAnimalScreenState extends State<MainAnimalScreen> {
  final List<Map<String, dynamic>> cattleList = [
    {
      'name': 'Vaca 1',
      'code': '123',
      'sex': 'Hembra',
      'admissionDate': '01/01/2022',
      'color': 'Negro',
      'breed': 'Angus',
      'imageUrl': 'assets/splash/splash1.png',
    },
    {
      'name': 'Vaca 2',
      'code': '123',
      'sex': 'Macho',
      'admissionDate': '01/01/2022',
      'color': 'Negro',
      'breed': 'Angus',
      'imageUrl': 'assets/splash/splash1.png',
    },
    {
      'name': 'Vaca 3',
      'code': '123',
      'sex': 'Macho',
      'admissionDate': '01/01/2022',
      'color': 'Negro',
      'breed': 'Angus',
      'imageUrl': 'assets/splash/splash1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        showBackButton: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cattleList.length,
              itemBuilder: (context, index) {
                return AnimalCard(
                  name: cattleList[index]['name'],
                  code: cattleList[index]['code'],
                  sex: cattleList[index]['sex'],
                  admissionDate: cattleList[index]['admissionDate'],
                  color: cattleList[index]['color'],
                  breed: cattleList[index]['breed'],
                  imageUrl: cattleList[index]['imageUrl'],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AnimalBodyScreen(title: 'Registrar Nuevo')),
          );
        },
        backgroundColor: Palette.backgroundColor,
        child: Icon(Icons.add),
      ),
    );
  }
}