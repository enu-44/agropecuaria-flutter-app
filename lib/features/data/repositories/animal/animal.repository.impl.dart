import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_box_const.dart';
import 'package:agropecuariosapp/features/data/datasources/hive/entities/animal_hive.dart';
import 'package:agropecuariosapp/features/data/mappers/animal.mapper.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/update_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';
import 'package:hive/hive.dart';

class AnimalRepositoryImpl implements AnimalRepository {
  Box<AnimalEntityHive> get getAnimalBox =>
      Hive.box<AnimalEntityHive>(HiveBoxConst.kAnimalBoxName);

  @override
  Future<Result<bool, Failure>> create(
      CreateAnimalRequestEntity request) async {
    await getAnimalBox.add(request.toHive());
    return Result.ok(true);
  }

  @override
  Future<Result<List<AnimalEntity>, Failure>> listByAccountIdAndAnimalTypeId(
      int accountId, int animalTypeId) async {
    final List<AnimalEntityHive> result = getAnimalBox.values
        .where(
            (e) => e.accountId == accountId && e.animalTypeId == animalTypeId)
        .toList();
    return Result.ok(result.map((e) => e.toEntity()).toList());
  }

  @override
  Future<Result<AnimalEntity, Failure>> update(
      UpdateAnimalRequestEntity request) async {
    await getAnimalBox.put(request.id, request.toHive());
    return Result.ok(getAnimalBox.get(request.id)!.toEntity());
  }

  @override
  Future<int> countByAnimalTypeId(int request) async =>
      getAnimalBox.values.where((_) => _.animalTypeId == request).length;

  @override
  Future<Result<bool, Failure>> deleteById(int id) async {
    await getAnimalBox.delete(id);
    return Result.ok(true);
  }

  @override
  Future<Result<List<AnimalEntity>, Failure>> searchByAccountIdAndAnimalTypeId(
      String query, int accountId, int animalTypeId) async {
    final List<AnimalEntityHive> result = getAnimalBox.values
        .where((e) =>
            e.accountId == accountId &&
            e.animalTypeId == animalTypeId &&
            (e.name.contains(query) || e.code.contains(query)))
        .toList();
    return Result.ok(result.map((e) => e.toEntity()).toList());
  }
}
