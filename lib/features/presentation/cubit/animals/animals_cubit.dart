// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/createAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/getAnimals.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal_type/getAnimalsTypes.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signIn.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signup.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'animals_state.dart';

class AnimalsCubit extends Cubit<AnimalsState> {

  final GetAnimalsTypesUseCase getAnimalsTypesUseCase;
  final GetAnimalsUseCase getAnimalsUseCase;

  AnimalsCubit({required this.getAnimalsUseCase, required this.getAnimalsTypesUseCase})
      : super(AnimalInitial());

  
  Future<void> listTypeAnimals() async {
    final result = await getAnimalsTypesUseCase.call();
    if(result.isOk){
      final List<AnimalTypeEntity> animalTypes = result.value ?? [];
      emit(AnimalTypeListLoaded(animalTypes));
    }else{
      final msg = result.error!.message;
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(AnimalFailure());
    }
  }

  Future<void> listAnimalsByType(int param) async {
    final result = await getAnimalsUseCase.call(param);
    if(result.isOk){
      final List<AnimalEntity> animals = result.value ?? [];
      emit(AnimalListLoaded(animals));
    }else{
      final msg = result.error!.message;
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(AnimalFailure());
    }
  }
}
