import 'dart:async';

import 'package:agropecuariosapp/features/presentation/pages/signIn/signin.screen.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    Timer(Duration(seconds: 3), () {
      // Navegar a la pantalla principal después de 3 segundos
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash/splash1.png', width: 250, height: 250),
            const SizedBox(height: 20),
            if (isLoading) // Mostrar el indicador de carga si isLoading es true
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}