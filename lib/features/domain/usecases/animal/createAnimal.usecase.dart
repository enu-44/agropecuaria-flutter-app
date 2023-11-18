import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';

class CreateAnimalUseCase {
  final AnimalRepository repository;

  CreateAnimalUseCase({required this.repository});
  Future<Result<bool, Failure>> call(CreateAnimalRequestEntity request) async =>
      repository.create(request);
}
