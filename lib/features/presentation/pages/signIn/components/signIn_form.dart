// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_returning_null_for_void, prefer_final_fields, unused_field

import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../size_config.dart';
import '../../../widgets/custom_surfix_icon.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/input_credential.dart';

class SignInForm extends StatefulWidget {
  final bool isSigningIn;
  const SignInForm({ Key? key, required this.isSigningIn }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? remember = false;
  final List<String?> errors = [];

  bool _isSigningIn = false;


  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          InputCredential(
            controller: _emailController,
            hintText: "Ingresar Email",
            labelText: "Email",
            icons: Icons.email_outlined,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _passwordController,
            hintText: "Ingresar Password",
            labelText: "Password",
            isPasswordField: true,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          _isSigningIn ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Espera un momento", style: TextStyle(color: Palette.backgroundColor, fontSize: 16, fontWeight: FontWeight.w400),),
              sizeHor(10),
              CircularProgressIndicator(color: Palette.backgroundColor,)
            ],
          ) :
          DefaultButton(
            text: "Continue",
            state: true,
            press: () {
              _signInUser();
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
        ],
      ),
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: AlertErr.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: AlertErr.kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: AlertErr.kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: AlertErr.kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: AlertErr.kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: AlertErr.kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: AlertErr.kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: AlertErr.kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  void _signInUser() {
    setState(() {
      _isSigningIn = true;
    });
    BlocProvider.of<CredentialsCubit>(context).signInUser(
      email: _emailController.text,
      password: _passwordController.text,
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _isSigningIn = false;
    });
    // Navigator.pushNamedAndRemoveUntil(context, PageConst.HomePage, (route) => false);
  }

  
}

