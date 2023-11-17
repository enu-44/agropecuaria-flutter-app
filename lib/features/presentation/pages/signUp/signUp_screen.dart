// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'components/signUp_body.dart';

class SignUpScreen extends StatefulWidget {
  // final VoidCallback onTapClickListener;
  // const SignUpScreen({Key? key, required this.onTapClickListener }) : super(key: key);
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody()
    );
  }
}