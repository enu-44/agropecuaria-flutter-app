import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/account.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/request/create_account.entity.dart';

abstract class AuthRepository {
  //Credentials
  Future<Result<bool, Failure>> signUp(CreateAccountEntity request);
  Future<Result<AccountEntity, Failure>> signIn(
      String userName, String password);
  Future<void> signOut();
  Future<bool> isSignIn();
  Future<AccountEntity> getSignInActive();
}
