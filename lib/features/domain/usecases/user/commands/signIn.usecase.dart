import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/account.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';

class SignInUseCase {
  final AuthRepository repository;
  SignInUseCase({required this.repository});
  Future<Result<AccountEntity, Failure>> call(
          String userName, String password) =>
      repository.signIn(userName, password);
}
