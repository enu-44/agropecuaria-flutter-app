
import 'package:agropecuariosapp/features/domain/repositories/user/user.repository.dom.dart';

class GetCurrentUidUseCase {
  final UserRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call(){
    return repository.getCurrentUid();
  }
}