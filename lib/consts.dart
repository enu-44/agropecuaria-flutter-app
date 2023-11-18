import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color.fromARGB(255, 160, 154, 152);
  static const Color backgroundColorSecondary =
      Color.fromARGB(255, 62, 143, 214);
  static const kSecondaryColor = Color.fromARGB(255, 242, 242, 242);
  static const kTextColor = Color(0xFF757575);
}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class AlertErr {
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";
}

class AnimationConst {
  static const kAnimationDuration = Duration(milliseconds: 50);
}

class PageConst {
  static const String Splash = "Splash";
  static const String mainAuth = "mainAuth";
  static const String HomePage = "homeScreen";
  static const String ProfilePage = "profileScreen";
  static const String LoginPage = "signInScreen";
  static const String RegisterPage = "signUpScreen";
  static const String RoutesPage = "routesScreen";
  static const String Main = "MainCattleScreen";
}

class FirebaseConst {
  static const String users = "users";
  static const String rols = "rols";
  static const String enterprise = "enterprise";
  static const String routes = "routes";
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Palette.backgroundColor,
      textColor: Colors.black,
      fontSize: 16.0);
}

Widget sizeVer(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sizeHor(double width) {
  return SizedBox(width: width);
}
