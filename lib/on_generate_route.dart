// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';
import 'package:agropecuariosapp/features/presentation/pages/home/home_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/components/animal_body_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/main_animal_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/main/main_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/signIn/signin.screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/signUp/signUp_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/splash/splash.dart';
import 'package:flutter/material.dart';

import 'consts.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.LoginPage:
        {
          return routeBuilder(SignInScreen());
        }
      case PageConst.HomePage:
        {
          return routeBuilder(HomeScreen());
        }
      // case PageConst.ProfilePage: {
      //   if (args is UserEntity) {
      //     return routeBuilder(ProfileScreen(currentUser: args));
      //   } else {
      //     return routeBuilder(NoPageFound());
      //   }
      // }
      case PageConst.RegisterPage:
        {
          return routeBuilder(SignUpScreen());
        }
      case PageConst.Splash:
        {
          return routeBuilder(SplashWidget());
        }
      case PageConst.Main:
        {
          if (args is AnimalTypeEntity) {
            return routeBuilder(MainAnimalScreen(data: args));
          } else {
            return routeBuilder(NoPageFound());
          }
        }
      default:
        {
          NoPageFound();
        }
    }
  }
}

dynamic routeBuilder(Widget child, {dynamic arguments}) {
  return MaterialPageRoute(
      builder: (context) => child,
      settings: RouteSettings(arguments: arguments));
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
