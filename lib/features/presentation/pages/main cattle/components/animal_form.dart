import 'package:agropecuariosapp/features/presentation/widgets/default_button.dart';
import 'package:agropecuariosapp/features/presentation/widgets/form_error.dart';
import 'package:agropecuariosapp/features/presentation/widgets/input_credential.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';

class AnimalForm extends StatefulWidget {
  const AnimalForm({super.key});

  @override
  State<AnimalForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _loteController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  String _selectedSexStatus = 'MACHO';
  String _selectedRaceStatus = 'Bovino';
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          InputCredential(
            controller: _nameController,
            hintText: "Ingresar Nombre",
            labelText: "Nombre",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _codeController,
            hintText: "Ingresar Codigo",
            labelText: "Codigo",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _numberController,
            hintText: "Ingresar Numero de arete",
            labelText: "Numero de arete",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _loteController,
            hintText: "Ingresar Lote",
            labelText: "Lote",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DropdownButtonFormField<String>(
            value: _selectedSexStatus,
            items: <String>['MACHO', 'HEMBRA'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedSexStatus = newValue!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Sexo',
              hintText: 'Seleccionar el sexo',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DropdownButtonFormField<String>(
            value: _selectedRaceStatus,
            items: <String>['Bovino', 'Lechero', 'Ovino'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedRaceStatus = newValue!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Raza',
              hintText: 'Seleccionar el raza',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _colorController,
            hintText: "Ingresar Color",
            labelText: "Color",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _descriptionController,
            inputType: TextInputType.multiline,
            maxLines: 5,
            hintText: "Ingresar Caracteristica",
            labelText: "Caracteristica",
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: "GUARDAR",
            state: true,
            press: () {
              print('funciona el boton');
              // if (widget.task!.id != '') {
              //   _edit();
              // }else{
              //   _save();
              // }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
        ]));
  }
}
