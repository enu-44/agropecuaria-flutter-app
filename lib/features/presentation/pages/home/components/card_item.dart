
import 'package:agropecuariosapp/consts.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final int count;
  final String imageUrl;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.title,
    required this.count,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 150,
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              trailing:  Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Palette.backgroundColor, 
                    width: 2.0, 
                  ),
                  borderRadius: BorderRadius.circular(50.0), // Radio de la esquina
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}