import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';

class IsSignInUseCase {
  final AuthRepository repository;
  IsSignInUseCase({required this.repository});
  Future<bool> call() => repository.isSignIn();
}
