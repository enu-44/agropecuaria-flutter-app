import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AnimalBodyScreen extends StatefulWidget {
  final String title;

  const AnimalBodyScreen({super.key, required this.title});

  @override
  State<AnimalBodyScreen> createState() => _AnimalBodyScreenState();
}

class _AnimalBodyScreenState extends State<AnimalBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        showBackButton: true,
      ),
    );
  }
}