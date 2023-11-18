import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';

abstract class AnimalTypeRepository {
  Future<Result<List<AnimalTypeEntity>, Failure>> list();
}
