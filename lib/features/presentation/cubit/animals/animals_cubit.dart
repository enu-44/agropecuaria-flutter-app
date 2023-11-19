// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/deleteAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/getAnimals.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/searchAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal_type/getAnimalsTypes.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'animals_state.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  final GetAnimalsTypesUseCase getAnimalsTypesUseCase;
  final GetAnimalsUseCase getAnimalsUseCase;
  final SearchAnimalsUseCase searchAnimalsUseCase;
  final DeleteAnimalUseCase deleteAnimalUseCase;

  AnimalsCubit(
      {required this.getAnimalsUseCase,
      required this.getAnimalsTypesUseCase,
      required this.searchAnimalsUseCase,
      required this.deleteAnimalUseCase})
      : super(AnimalInitial());

  Future<void> listAnimalsByType(int param) async {
    final result = await getAnimalsUseCase.call(param);
    if (result.isOk) {
      final List<AnimalEntity> animals = result.value ?? [];
      emit(AnimalListLoaded(animals));
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
      emit(AnimalFailure());
    }
  }

  Future<void> delete(int animalId) => deleteAnimalUseCase.call(animalId);

  Timer? _debounce;
  Future<void> searchAnimals(String query, int animalTypeId) async {
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final result = await searchAnimalsUseCase.call(query, animalTypeId);
      if (result.isOk) emit(AnimalListLoaded(result.value ?? []));
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
