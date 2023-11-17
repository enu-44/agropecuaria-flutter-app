


import 'package:agropecuariosapp/features/domain/repositories/user/user.repository.dom.dart';

class IsSignInUseCase {
  final UserRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() {
    return repository.isSignIn();
  }
}