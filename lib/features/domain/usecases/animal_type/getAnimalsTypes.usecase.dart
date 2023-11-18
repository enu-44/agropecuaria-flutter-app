// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal_type/animal_type.repository.dart';

class GetAnimalsTypesUseCase {
  final AnimalRepository animalRepository;
  final AnimalTypeRepository animalTypeRepository;

  GetAnimalsTypesUseCase(
      {required this.animalRepository, required this.animalTypeRepository});
  Future<Result<List<AnimalTypeEntity>, Failure>> call() async {
    final resultTypes = await animalTypeRepository.list();
    if (resultTypes.isError) return Result.error(resultTypes.error!);
    var data = await Stream<AnimalTypeEntity>.fromIterable(resultTypes.value!)
        .asyncMap((event) async {
      final result = await animalRepository.countByAnimalTypeId(event.id);
      event.countAnimals = result;
      return event;
    }).toList();
    return Result.ok(data);
  }
}
