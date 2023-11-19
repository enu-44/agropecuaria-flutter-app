import 'dart:io';
import 'dart:typed_data';

import 'package:agropecuariosapp/features/core/utils/auth.utils.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/update_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/parameters/parameters.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/form/animals_form_cubit.dart';
import 'package:agropecuariosapp/features/presentation/widgets/default_button.dart';
import 'package:agropecuariosapp/features/presentation/widgets/form_error.dart';
import 'package:agropecuariosapp/features/presentation/widgets/input_credential.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AnimalForm extends StatefulWidget {
  final AnimalEntity? data;
  final int animalTypeId;
  const AnimalForm({super.key, this.data, required this.animalTypeId});

  @override
  State<AnimalForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _loteController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedSexStatus = 'Hembra';
  String _selectedRaceStatus = 'Holstein';
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

  ImageProvider getImage() {
    if (_image != null) {
      return FileImage(_image!);
    }

    if (widget.data?.photoPath != null) {
      _image = File(widget.data!.photoPath!);
      return FileImage(_image!);
    }

    return const AssetImage('assets/splash/splash1.png');
  }

  @override
  void initState() {
    if (widget.data != null) {
      _nameController.text = widget.data?.name ?? "";
      _codeController.text = widget.data?.code ?? "";
      _numberController.text = widget.data?.earringNumber ?? "";
      _loteController.text = widget.data?.lote ?? "";
      _colorController.text = widget.data?.color ?? "";
      _descriptionController.text = widget.data?.characteristics ?? "";
      _selectedSexStatus = widget.data?.sexo ?? "Hembra";
      _selectedRaceStatus = widget.data?.race ?? "Holstein";
    }
    super.initState();
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
                image: getImage(),
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
            items: DEFAULT_DATA_SEXO.map((String value) {
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
            items: DEFAULT_DATA_RACES.map((String value) {
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
            press: () async {
              if (widget.data != null) {
                _updateAnimal(UpdateAnimalRequestEntity(
                    id: widget.data!.id,
                    accountId: widget.data!.accountId,
                    animalTypeId: widget.animalTypeId,
                    name: _nameController.text,
                    code: _codeController.text,
                    sexo: _selectedSexStatus,
                    race: _selectedRaceStatus,
                    color: _colorController.text,
                    photoPath: _image?.path,
                    characteristics: _descriptionController.text,
                    lote: _loteController.text,
                    earringNumber: _numberController.text));
              } else {
                _addAnimals(CreateAnimalRequestEntity(
                    accountId: await AuthUtils.getAuthenticateAccountId(),
                    animalTypeId: widget.animalTypeId,
                    name: _nameController.text,
                    code: _codeController.text,
                    sexo: _selectedSexStatus,
                    race: _selectedRaceStatus,
                    color: _colorController.text,
                    photoPath: _image?.path,
                    characteristics: _descriptionController.text,
                    lote: _loteController.text,
                    earringNumber: _numberController.text));
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
        ]));
  }

  void _updateAnimal(UpdateAnimalRequestEntity params) {
    BlocProvider.of<AnimalsFormCubit>(context)
        .updateAnimal(params)
        .then((value) => _clear());
  }

  void _addAnimals(CreateAnimalRequestEntity params) {
    BlocProvider.of<AnimalsFormCubit>(context)
        .addAnimals(params)
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _selectedRaceStatus = 'Holstein';
      _selectedSexStatus = 'Hembra';
      _image = null;
    });
    _nameController.clear();
    _codeController.clear();
    _numberController.clear();
    _loteController.clear();
    _colorController.clear();
    _descriptionController.clear();
    Navigator.pop(context, true);
  }
}
