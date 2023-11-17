


import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/user/authentication.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';

abstract class RemoteDataSource {
  // Credentials Features
  Future<Result<ApiResponse<bool>, Failure>> signUpUser(UserEntity user);
  Future<Result<ApiResponse<AuthEntity>, Failure>> signInUser(UserEntity user);
  Future<void> signOut();
  Future<bool> isSignIn();
  Future<String> getCurrentUid();

  //TASK
  Future<Result<ApiResponse<bool>, Failure>> add(TaskRequestEntity params);
  Future<Result<ApiResponse<List<TaskEntity>>, Failure>> list();
  Future<Result<ApiResponse<bool>, Failure>> edit(TaskRequestEntity params);
  Future<Result<ApiResponse<bool>, Failure>> delete(int param);
}