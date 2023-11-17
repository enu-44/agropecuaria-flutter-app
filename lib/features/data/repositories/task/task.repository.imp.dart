

import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/data/datasources/remote/remote.datasource.dart';
import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/task/task.repository.dom.dart';

class TaskRepositoryImpl implements TaskRepository{
  final RemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<ApiResponse<bool>, Failure>> add(TaskRequestEntity params) async => remoteDataSource.add(params);

  @override
  Future<Result<ApiResponse<List<TaskEntity>>, Failure>> list() async => remoteDataSource.list();

  @override
  Future<Result<ApiResponse<bool>, Failure>> edit(TaskRequestEntity params) async => remoteDataSource.edit(params);

  @override
  Future<Result<ApiResponse<bool>, Failure>> delete(int params) async => remoteDataSource.delete(params);
  
}