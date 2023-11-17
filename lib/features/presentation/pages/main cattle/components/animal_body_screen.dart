import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_form.dart';
import 'package:agropecuariosapp/features/presentation/widgets/appbar.dart';
import 'package:agropecuariosapp/size_config.dart';
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
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        showBackButton: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                AnimalForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}