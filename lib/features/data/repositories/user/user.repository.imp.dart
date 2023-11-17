

import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/data/datasources/remote/remote.datasource.dart';
import 'package:agropecuariosapp/features/domain/entities/user/authentication.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/user/user.repository.dom.dart';

class UserRepositoryImpl implements UserRepository{
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<ApiResponse<bool>, Failure>> signUp(UserEntity user) async => remoteDataSource.signUpUser(user);

  @override
  Future<Result<ApiResponse<AuthEntity>, Failure>> signIn(UserEntity user) async => remoteDataSource.signInUser(user);

  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signOut() async => remoteDataSource.signOut();
  
}