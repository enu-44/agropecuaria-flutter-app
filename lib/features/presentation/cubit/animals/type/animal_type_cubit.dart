// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal_type/getAnimalsTypes.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'animal_type_state.dart';

class AnimalTypeCubit extends Cubit<AnimalTypeState> {
  final GetAnimalsTypesUseCase getAnimalsTypesUseCase;

  AnimalTypeCubit({required this.getAnimalsTypesUseCase})
      : super(AnimalTypeInitial());

  Future<void> listTypeAnimals() async {
    final result = await getAnimalsTypesUseCase.call();
    if (result.isOk) {
      final List<AnimalTypeEntity> animalTypes = result.value ?? [];
      emit(AnimalTypeListLoaded(animalTypes));
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
      emit(AnimalTypeFailure());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
