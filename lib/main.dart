import 'package:agropecuariosapp/features/data/datasources/hive/config/datasource_hive_instance.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/animals_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/form/animals_form_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/home/home_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/main%20cattle/main_animal_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/main/main_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/splash/splash.dart';
import 'package:agropecuariosapp/on_generate_route.dart';
import 'package:agropecuariosapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'consts.dart';
import 'injection_container.dart' as di;

Future main() async {
  // await dotenv.load(fileName: "assets/.env", mergeWith: {
  //   'API_URL': 'http://192.168.1.30:8001/api/',
  // });
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await DataSourceHiveInstance.initDbHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
          BlocProvider(create: (_) => di.sl<CredentialsCubit>()),
          BlocProvider(create: (_) => di.sl<AnimalsCubit>()),
          BlocProvider(create: (_) => di.sl<AnimalsFormCubit>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: OnGenerateRoute.route,
          initialRoute: PageConst.Splash,
          /* routes: {
            "/": (context) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: ((context, authstate) {
                  if (authstate is Authenticated) {
                    return const HomeScreen();
                  } else {
                    return const SplashWidget();
                  }
                }),
              );
            }
          }, */
        ));
  }
}
