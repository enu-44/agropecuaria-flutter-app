// ignore_for_file: prefer_const_constructors

import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/pages/signUp/components/signUp_form.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';


class SignUpBody extends StatefulWidget {
  const SignUpBody({ Key? key }) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
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
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Registrate",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Crear una cuenta es gratis y puedes compartir tu experiencia",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                // Text(
                //   '-OR SIGN IN WITH-',
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.caption,
                // ),
                // SizedBox(height: getProportionateScreenHeight(10)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocialNetworkCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocialNetworkCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocialNetworkCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(10)),
                _AccountText(),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  'Al continuar, confirma que está de acuerdo \ncon nuestro Término y condición',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _AccountText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ya tienes una cuenta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(context, PageConst.LoginPage, (route) => false),
          child: Text(
            "Inicia sesion",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Palette.backgroundColor),
          ),
        ),
      ],
    );
  }
}