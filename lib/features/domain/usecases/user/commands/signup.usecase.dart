import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/request/create_account.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';

class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase({required this.repository});
  Future<Result<bool, Failure>> call(CreateAccountEntity params) =>
      repository.signUp(params);
}
