import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/update_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';

class UpdateAnimalUseCase {
  final AnimalRepository repository;

  UpdateAnimalUseCase({required this.repository});
  Future<Result<AnimalEntity, Failure>> call(
          UpdateAnimalRequestEntity request) async =>
      repository.update(request);
}
