// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_returning_null_for_void

import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:agropecuariosapp/features/presentation/widgets/default_button.dart';
import 'package:agropecuariosapp/features/presentation/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../size_config.dart';
import '../../../widgets/custom_surfix_icon.dart';
import '../../../widgets/input_credential.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({ Key? key }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmepasswordController = TextEditingController();
  String? email;
  String? password;
  String? conform_password;
  bool agree = false;
  final List<String?> errors = [];
  bool _isSigningUp = false;

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
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmepasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // buildEmailFormField(),
          InputCredential(
            controller: _usernameController,
            hintText: "Ingresar Nombre Completo",
            labelText: "Fullname",
            icons: Icons.person,
            inputType: TextInputType.name
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          InputCredential(
            controller: _emailController,
            hintText: "Ingresar Email",
            labelText: "Email",
            icons: Icons.email_outlined,
            inputType: TextInputType.emailAddress
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          InputCredential(
            controller: _passwordController,
            hintText: "Ingresar Password",
            labelText: "Password",
            inputType: TextInputType.visiblePassword,
            isPasswordField: true,
          ),
          // buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          InputCredential(
            controller: _confirmepasswordController,
            hintText: "Confirmar Password",
            labelText: "Password",
            isPasswordField: true,
            inputType: TextInputType.visiblePassword,
          ),
          // buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              Checkbox(
                value: agree,
                activeColor: Palette.backgroundColor,
                onChanged: (value) {
                  setState(() {
                    agree = value!;
                  });
                },
              ),
              GestureDetector(
                onTap: (){},
                child: Text(
                  "Acepto termino y condiciones",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          _isSigningUp ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Espera un momento", style: TextStyle(color: Palette.backgroundColor, fontSize: 16, fontWeight: FontWeight.w400),),
              sizeHor(10),
              CircularProgressIndicator(color: Palette.backgroundColor,)
            ],
          ) :
          DefaultButton(
            text: "Continue",
            state: agree,
            press: () {
              _signUpUser();
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // if all are valid then go to success screen
              //   KeyboardUtil.hideKeyboard(context);
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // }
            },
          ),
        ],
      ),
    );
  }
  
  
  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: AlertErr.kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: AlertErr.kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: AlertErr.kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: AlertErr.kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        password = value;
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

  Future<void> _signUpUser() async {
    setState(() {
      _isSigningUp = true;
    });
    BlocProvider.of<CredentialsCubit>(context).signUpUser(
        user: UserEntity(
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        )
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _emailController.clear();
      _passwordController.clear();
      agree = false;
      _isSigningUp = false;
    });
    // Navigator.pushNamedAndRemoveUntil(context, PageConst.HomePage, (route) => false);
  }
}