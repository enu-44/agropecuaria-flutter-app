import 'dart:io';

import 'package:agropecuariosapp/features/presentation/widgets/default_button.dart';
import 'package:agropecuariosapp/features/presentation/widgets/form_error.dart';
import 'package:agropecuariosapp/features/presentation/widgets/input_credential.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;

  final ImagePicker _picker = ImagePicker();

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

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  ImageProvider getImage(File? image) {
    if(image !=null){
       return FileImage(image);
    }
    return const AssetImage('assets/splash/splash1.png');
  }

  @override
  Widget build(BuildContext context) {
    
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Container(
              width: 150, 
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(_image),
                ),
              ),
            ),
          SizedBox(height: getProportionateScreenHeight(5)),
          ElevatedButton(
            onPressed: _getImageFromCamera,
            child: Text('Subir Foto'),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
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
