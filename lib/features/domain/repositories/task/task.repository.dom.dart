
import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';

abstract class TaskRepository {
  //Task
  Future<Result<ApiResponse<bool>, Failure>> add(TaskRequestEntity params);
  Future<Result<ApiResponse<List<TaskEntity>>, Failure>> list();
  Future<Result<ApiResponse<bool>, Failure>> edit(TaskRequestEntity params);
  Future<Result<ApiResponse<bool>, Failure>> delete(int params);
}