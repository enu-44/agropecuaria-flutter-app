
import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/user/user.repository.dom.dart';

class SignUpUseCase{
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<Result<ApiResponse<bool>, Failure>> call(UserEntity params){
    return repository.signUp(params);
  }
}