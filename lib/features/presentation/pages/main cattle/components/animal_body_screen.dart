import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/form/animals_form_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_form.dart';
import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalBodyScreen extends StatefulWidget {
  final String title;
  final int animalTypeId;
  final AnimalEntity? data;
  const AnimalBodyScreen(
      {super.key, required this.title, required this.animalTypeId, this.data});

  @override
  State<AnimalBodyScreen> createState() => _AnimalBodyScreenState();
}

class _AnimalBodyScreenState extends State<AnimalBodyScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        showBackButton: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                AnimalForm(
                  animalTypeId: widget.animalTypeId,
                  data: widget.data,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
