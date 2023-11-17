// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/task/commands/taskl.edit.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'edit_state.dart';

class TaskEditCubit extends Cubit<TaskEditState> {
  final TaskEditUseCase taskEditUseCase;

  TaskEditCubit({required this.taskEditUseCase}) : super(TaskEditInitial());

  Future<void> edit({required TaskRequestEntity params}) async {
    emit(TaskEditLoading());
    try {
      final result = await taskEditUseCase.call(params);
      if (result.isOk) {      
        emit(TaskEdituccess());
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
          emit(TaskEditFailure());
      }
    } on SocketException catch(_) {
      emit(TaskEditFailure());
    } catch (_) {
      emit(TaskEditFailure());
    }
  }
}
