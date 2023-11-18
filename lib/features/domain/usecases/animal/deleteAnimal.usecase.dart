import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';

class DeleteAnimalUseCase {
  final AnimalRepository repository;

  DeleteAnimalUseCase({required this.repository});
  Future<Result<bool, Failure>> call(int id) async => repository.deleteById(id);
}
