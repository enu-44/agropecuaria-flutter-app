import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String fullName;
  final String userName;
  const AccountEntity(
      {required this.id, required this.fullName, required this.userName});
  @override
  List<Object?> get props => [id, fullName, userName];
}
