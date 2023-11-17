// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/task/commands/taskl.add.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';



part 'create_state.dart';

class TaskCreateCubit extends Cubit<TaskCreateState> {
  final TaskAddUseCase taskAddUseCase;

  TaskCreateCubit({required this.taskAddUseCase}) : super(TaskCreateInitial());

  Future<void> add({required TaskRequestEntity params}) async {
    emit(TaskCreateLoading());
    try {
      final result = await taskAddUseCase.call(params);
      if (result.isOk) {      
        emit(TaskCreateuccess());
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
          emit(TaskCreateFailure());
      }
    } on SocketException catch(_) {
      emit(TaskCreateFailure());
    } catch (_) {
      emit(TaskCreateFailure());
    }
  }
}
