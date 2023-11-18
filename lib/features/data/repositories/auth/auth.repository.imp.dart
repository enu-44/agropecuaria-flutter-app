import 'package:agropecuariosapp/features/core/extensions/iterable.extension.dart';
import 'package:agropecuariosapp/features/core/utils/auth.utils.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_box_const.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/entities/account_hive.dart';
import 'package:agropecuariosapp/features/data/mappers/account.mapper.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/account.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/request/create_account.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';
import 'package:hive/hive.dart';

class UserRepositoryImpl implements AuthRepository {
  UserRepositoryImpl();

  Box<AccountEntityHive> get getAccountBox =>
      Hive.box<AccountEntityHive>(HiveBoxConst.kAccountBoxName);

  @override
  Future<bool> isSignIn() => AuthUtils.isAuthenticated();

  @override
  Future<Result<AccountEntity, Failure>> signIn(
      String userName, String password) async {
    final AccountEntityHive? exist = getAccountBox.values.firstWhereOrNull(
        (AccountEntityHive e) =>
            e.userName == userName && e.password == password);
    if (exist == null) {
      return Result.error(Failure("Credenciales invalidas", 401));
    }
    await AuthUtils.setIsAuthenticate(exist.key);
    return Result.ok(exist.toEntity());
  }

  @override
  Future<void> signOut() => AuthUtils.removeAuthenticate();

  @override
  Future<Result<bool, Failure>> signUp(CreateAccountEntity request) async {
    await getAccountBox.add(request.toHive());
    return Result.ok(true);
  }

  @override
  Future<AccountEntity> getSignInActive() async {
    final int accountId = await AuthUtils.getAuthenticateAccountId();
    return getAccountBox.get(accountId)!.toEntity();
  }
}
