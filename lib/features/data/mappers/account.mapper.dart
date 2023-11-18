import 'package:agropecuariosapp/features/data/datasources/hive/entities/account_hive.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/account.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/request/create_account.entity.dart';

extension CreateAccountEntityMapper on CreateAccountEntity {
  AccountEntityHive toHive() {
    return AccountEntityHive(
        fullName: fullName, password: password, userName: userName);
  }
}

extension AccountEntityMapper on AccountEntityHive {
  AccountEntity toEntity() {
    return AccountEntity(id: key, fullName: fullName, userName: userName);
  }
}
