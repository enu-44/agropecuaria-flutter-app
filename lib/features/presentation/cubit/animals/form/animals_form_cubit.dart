// ignore_for_file: non_constant_identifier_names

import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/update_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/createAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/updateAnimals.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'animals_form_state.dart';

class AnimalsFormCubit extends Cubit<AnimalsFormState> {
  final CreateAnimalUseCase createAnimalUseCase;
  final UpdateAnimalUseCase updateAnimalUseCase;

  AnimalsFormCubit(
      {required this.createAnimalUseCase, required this.updateAnimalUseCase})
      : super(AnimalFormInitial());

  Future<void> addAnimals(CreateAnimalRequestEntity params) async {
    final result = await createAnimalUseCase.call(params);
    if (result.isOk) {
      emit(AnimalFormSuccess());
    } else {
      final msg = result.error!.message;
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(AnimalFormFailure());
    }
  }

  Future<void> updateAnimal(UpdateAnimalRequestEntity params) async {
    final result = await updateAnimalUseCase.call(params);
    if (result.isOk) {
      emit(AnimalFormSuccess());
    } else {
      final msg = result.error!.message;
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(AnimalFormFailure());
    }
  }
}
