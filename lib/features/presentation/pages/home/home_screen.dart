import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/pages/home/components/card_item.dart';
import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Bovino', 'count': 10, 'imageUrl': 'assets/splash/splash1.png'},
    {'title': 'Lechero', 'count': 15, 'imageUrl': 'assets/splash/splash1.png'},
    {'title': 'Ovino', 'count': 5, 'imageUrl': 'assets/splash/splash1.png'},
    {'title': 'Caprino', 'count': 20, 'imageUrl': 'assets/splash/splash1.png'},
    {'title': 'Porcion', 'count': 15, 'imageUrl': 'assets/splash/splash1.png'},
    {'title': 'Equino', 'count': 6, 'imageUrl': 'assets/splash/splash1.png'},
    {
      'title': 'Doble proposito',
      'count': 4,
      'imageUrl': 'assets/splash/splash1.png'
    },
    {'title': 'Pastoreo', 'count': 6, 'imageUrl': 'assets/splash/splash1.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tipo de Ganado',
        onLogoutPressed: () {
          print('funciona');
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
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CustomCard(
              title: categories[index]['title'],
              count: categories[index]['count'],
              imageUrl: categories[index]['imageUrl'],
              onTap: () {
                  Navigator.pushNamed(
                    context,
                    PageConst.Main,
                    arguments: categories[index]['title'],
                  );
              },
            );
          },
        ),
      ),
    );
  }
}
