// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/pages/signIn/components/signIn_form.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({ Key? key }) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {

  bool isSigningIn = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                Image.asset('assets/splash/splash1.png', width: 150, height: 150),
                const SizedBox(height: 20),
                Text(
                  "Inicie sesión con su correo electrónico y contraseña",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SignInForm(isSigningIn: isSigningIn),
                SizedBox(height: getProportionateScreenHeight(20)),
                _noAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _noAccountText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No tienes una cuenta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(12)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(context, PageConst.RegisterPage, (route) => false),
          child: Text(
            "Registrate es Gratis",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
                color: Palette.backgroundColorSecondary),
          ),
        ),
      ],
    );
  }
}