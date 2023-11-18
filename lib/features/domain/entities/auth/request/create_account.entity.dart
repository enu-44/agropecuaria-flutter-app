import 'package:equatable/equatable.dart';

class CreateAccountEntity extends Equatable {
  final String fullName;
  final String userName;
  final String password;
  const CreateAccountEntity(
      {required this.fullName, required this.userName, required this.password});
  @override
  List<Object?> get props => [fullName, userName, password];
}
