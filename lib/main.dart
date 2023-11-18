import 'package:agropecuariosapp/features/data/datasources/hive/config/datasource_hive_instance.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/main/main_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/splash/splash.dart';
import 'package:agropecuariosapp/on_generate_route.dart';
import 'package:agropecuariosapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocProvider(create: (_) => di.sl<CredentialsCubit>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: OnGenerateRoute.route,
          initialRoute: "/",
          routes: {
            "/": (context) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: ((context, authstate) {
                  if (authstate is Authenticated) {
                    return const MainScreen();
                  } else {
                    return const SplashWidget();
                  }
                }),
              );
            }
          },
        ));
  }
}
