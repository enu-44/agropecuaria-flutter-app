
import 'package:agropecuariosapp/features/domain/usecases/user/commands/getCurrentUid.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/isSignIn.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  
  AuthCubit({required this.isSignInUseCase, required this.getCurrentUidUseCase}) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUseCase.call();
      if (isSignIn == true) {

        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch(_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    } catch(_) {
      emit(UnAuthenticated());
    }
  }

  // Future<void> loggedOut()async {
  //   try {
  //     await signOutUseCase.call();
  //     emit(UnAuthenticated());
  //   } catch (_) {
  //     emit(UnAuthenticated());
  //   }
  // }
}
