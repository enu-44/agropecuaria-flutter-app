import 'dart:io';

import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_box_const.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_typeid_const.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/entities/account_hive.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/entities/animal_hive.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/entities/animal_type_hive.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin DataSourceHiveInstance {
  static Future<HiveInterface> initDbHive() async {
    final Directory appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    //Register adapters - Here
    if (!Hive.isAdapterRegistered(HiveTypeIdConst.TypeAccountHive)) {
      Hive.registerAdapter(AccountHiveAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveTypeIdConst.TypeAnimalHive)) {
      Hive.registerAdapter(AnimalHiveAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveTypeIdConst.TypeAnimalTypeHive)) {
      Hive.registerAdapter(AnimalTypeHiveAdapter());
    }

    //Open Box - Here
    if (!Hive.isBoxOpen(HiveBoxConst.kAccountBoxName)) {
      await Hive.openBox<AccountEntityHive>(HiveBoxConst.kAccountBoxName);
    }
    if (!Hive.isBoxOpen(HiveBoxConst.kAnimalBoxName)) {
      await Hive.openBox<AnimalEntityHive>(HiveBoxConst.kAnimalBoxName);
    }
    if (!Hive.isBoxOpen(HiveBoxConst.kAnimalTypeBoxName)) {
      await Hive.openBox<AnimalTypeEntityHive>(HiveBoxConst.kAnimalTypeBoxName);
    }
    return Hive;
  }
}
