import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';

class SignOutUseCase {
  final AuthRepository repository;
  SignOutUseCase({required this.repository});
  Future<void> call() => repository.signOut();
}
