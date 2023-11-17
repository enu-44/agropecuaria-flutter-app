import 'dart:ffi';

import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/task/task.repository.dom.dart';


class TaskListUseCase{
  final TaskRepository repository;

  TaskListUseCase({required this.repository});

  Future<Result<ApiResponse<List<TaskEntity>>, Failure>> call(){
    return repository.list();
  }
}