import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_typeid_const.dart';

import 'package:hive/hive.dart';
part '../adapters/account_hive.adapter.dart';

@HiveType(
    adapterName: 'AccountHiveAdapter', typeId: HiveTypeIdConst.TypeAccountHive)
class AccountEntityHive extends HiveObject {
  AccountEntityHive(
      {required this.fullName, required this.userName, required this.password});

  @HiveField(0)
  String fullName;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String password;
}
