import 'dart:async';
import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/signIn/signin.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(listener: (context, state) {
       if(state is Authenticated) {
         Navigator.pushReplacementNamed(context, PageConst.HomePage);
       } else {
         Navigator.pushReplacementNamed(context, PageConst.LoginPage);
       }
    },child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash/splash1.png', width: 250, height: 250),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    ),)
    
    ;
  }
}