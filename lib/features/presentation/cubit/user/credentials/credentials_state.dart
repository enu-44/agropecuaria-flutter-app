part of 'credentials_cubit.dart';

@immutable
abstract class CredentialsState extends Equatable {
  const CredentialsState();
}

class CredentialInitial extends CredentialsState {
  @override
  List<Object> get props => [];
}

class CredentialLoading extends CredentialsState {
  @override
  List<Object> get props => [];
}


class CredentialSuccess extends CredentialsState {
  @override
  List<Object> get props => [];
}


class CredentialFailure extends CredentialsState {
  @override
  List<Object> get props => [];
}
