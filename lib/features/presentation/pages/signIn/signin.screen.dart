import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/main/main_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/signIn/components/signIn_body.dart';
import 'package:agropecuariosapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocConsumer<CredentialsCubit, CredentialsState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            toast("Invalid Email and Password");
          }
        },
        builder: (context, credentialState) {
                   if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid,);
                } else {
                  return SignInBody();
                }
              },
            );
          }
          return SignInBody();
        }
      ),
    );
  }
}