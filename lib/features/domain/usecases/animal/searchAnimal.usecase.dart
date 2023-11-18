import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/core/utils/result_response.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/auth/account.entity.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';
import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';

class SearchAnimalsUseCase {
  final AnimalRepository animalRepository;
  final AuthRepository authRepository;

  SearchAnimalsUseCase(
      {required this.animalRepository, required this.authRepository});
  Future<Result<List<AnimalEntity>, Failure>> call(
      String query, int animalTypeId) async {
    final AccountEntity account = await authRepository.getSignInActive();
    return animalRepository.searchByAccountIdAndAnimalTypeId(
        query, account.id, animalTypeId);
  }
}
