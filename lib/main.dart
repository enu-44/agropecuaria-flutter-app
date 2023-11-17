import 'package:agropecuariosapp/features/presentation/cubit/task/create/create_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/task/delete/delete_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/task/edit/edit_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/task/list/list_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/home/home_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/main/main_screen.dart';
import 'package:agropecuariosapp/features/presentation/pages/signIn/signin.screen.dart';
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
        BlocProvider(create: (_) => di.sl<TaskCreateCubit>()),
        BlocProvider(create: (_) => di.sl<TaskListCubit>()),
        BlocProvider(create: (_) => di.sl<TaskEditCubit>()),
        BlocProvider(create: (_) => di.sl<TaskDeleteCubit>()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: OnGenerateRoute.route,
      initialRoute: "/",
      routes: {
        "/" : (context) {
          return BlocBuilder<AuthCubit, AuthState>(builder: ((context, authstate){
            if (authstate is Authenticated) {
              return MainScreen(uid: 'sadasdasd15154ewqe');
            } else {
              return const HomeScreen();
            }
          }),);
        }
      },
    )
    );
  }
}