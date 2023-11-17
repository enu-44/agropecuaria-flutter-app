// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/task/commands/taskl.list.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskListUseCase taskListUseCase;

  TaskListCubit({required this.taskListUseCase}) : super(TaskListInitial());

  Future<void> list() async {
    emit(TaskListLoading());
    try {
      final result = await taskListUseCase.call();
      if (result.isOk) {      
        emit(TaskListLoaded(taskList: result.value!.data));
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
          emit(TaskListFailure());
      }
    } on SocketException catch(_) {
      emit(TaskListFailure());
    } catch (_) {
      emit(TaskListFailure());
    }
  }
}
