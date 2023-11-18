import 'dart:async';

import 'package:agropecuariosapp/features/domain/usecases/user/commands/isSignIn.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signOut.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({required this.isSignInUseCase, required this.signOutUseCase}) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    Timer(
      Duration(seconds: 2),
      () async {
        bool isSignIn = await isSignInUseCase.call();
        if (isSignIn) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      },
    );
   
  }

  void loggedIn() => emit(Authenticated());

  Future<void> loggedOut()async {
    await signOutUseCase.call();
    emit(UnAuthenticated());
  }
}
