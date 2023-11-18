import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/update_animal_request.entity.dart';

abstract class AnimalRepository {
  Future<Result<List<AnimalEntity>, Failure>> listByAccountIdAndAnimalTypeId(
      String accountId, int animalTypeId);
  Future<Result<bool, Failure>> create(CreateAnimalRequestEntity request);
  Future<Result<AnimalEntity, Failure>> update(
      UpdateAnimalRequestEntity request);
  Future<int> countByAnimalTypeId(int request);
}
