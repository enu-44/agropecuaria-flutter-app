// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:agropecuariosapp/features/domain/entities/auth/request/create_account.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signIn.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signup.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'credentials_state.dart';

class CredentialsCubit extends Cubit<CredentialsState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  CredentialsCubit({required this.signUpUseCase, required this.signInUseCase})
      : super(CredentialInitial());

  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(CredentialLoading());
    final result = await signInUseCase.call(email, password);
    if (result.isOk) {
      emit(CredentialSuccess());
    } else {
      final msg = result.error!.message;
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required CreateAccountEntity user}) async {
    emit(CredentialLoading());
    final result = await signUpUseCase.call(user);
    if (result.isOk) {
      Fluttertoast.showToast(
        msg: "Se ha registrado correctamente",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      emit(CredentialSuccess());
    } else {
      final msg = result.error!.message;
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(CredentialFailure());
    }
  }
}
