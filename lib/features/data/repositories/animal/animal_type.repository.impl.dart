import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_box_const.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/entities/animal_type_hive.dart';
import 'package:agropecuariosapp/features/data/mappers/animal_type.mapper.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal_type/animal_type.repository.dart';
import 'package:hive/hive.dart';

class AnimalTypeRepositoryImpl implements AnimalTypeRepository {
  Box<AnimalTypeEntityHive> get getAnimalTypeBox =>
      Hive.box<AnimalTypeEntityHive>(HiveBoxConst.kAnimalTypeBoxName);
  @override
  Future<Result<List<AnimalTypeEntity>, Failure>> list() async {
    final result = getAnimalTypeBox.values.map((e) => e.toEntity()).toList();
    return Result.ok(result);
  }
}
