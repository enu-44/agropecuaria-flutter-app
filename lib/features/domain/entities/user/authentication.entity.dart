import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  final bool? isLogin;

  AuthEntity({
    this.accessToken,
    this.refreshToken,
    this.isLogin
  });

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
    isLogin
  ];
}