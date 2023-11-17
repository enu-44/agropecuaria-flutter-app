// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:agropecuariosapp/features/core/utils/auth.utils.dart';
import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/user.signIn.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/user.signup.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'credentials_state.dart';

class CredentialsCubit extends Cubit<CredentialsState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  CredentialsCubit({required this.signUpUseCase, required this.signInUseCase}) : super(CredentialInitial());

  Future<void> signInUser({required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      final result = await signInUseCase.call(UserEntity(email: email, password: password));
      if (result.isOk) {
        final msg = result.value!.message;
        final prefs = await SharedPreferences.getInstance();
        await AuthUtils.saveAccessToken(result.value!.data.accessToken!);
        await AuthUtils.refreshAccessToken(result.value!.data.refreshToken!);
        await AuthUtils.isLogin(result.value!.data.isLogin.toString());
        
        emit(CredentialSuccess());
      }else{
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
    } on SocketException catch(_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      final result = await signUpUseCase.call(user);
      if (result.isOk) {
        final msg = result.value!.message;
        Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        emit(CredentialSuccess());
      }else{
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
    } on SocketException catch(_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
