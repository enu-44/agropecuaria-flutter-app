import 'package:agropecuariosapp/features/data/repositories/animal/animal.repository.impl.dart';
import 'package:agropecuariosapp/features/data/repositories/animal/animal_type.repository.impl.dart';
import 'package:agropecuariosapp/features/data/repositories/auth/auth.repository.imp.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal/animal.repository.dart';
import 'package:agropecuariosapp/features/domain/repositories/animal_type/animal_type.repository.dart';
import 'package:agropecuariosapp/features/domain/repositories/auth/auth.repository.dom.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/createAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/deleteAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/getAnimals.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/searchAnimal.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal/updateAnimals.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/animal_type/getAnimalsTypes.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/isSignIn.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signIn.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signOut.usecase.dart';
import 'package:agropecuariosapp/features/domain/usecases/user/commands/signup.usecase.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/animals_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/form/animals_form_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/animals/type/animal_type_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:agropecuariosapp/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // CUBIT
  // =============================================================================
  sl.registerFactory(() => AnimalTypeCubit(getAnimalsTypesUseCase: sl.call()));
  sl.registerFactory(() =>
      CredentialsCubit(signUpUseCase: sl.call(), signInUseCase: sl.call()));
  sl.registerFactory(
      () => AuthCubit(isSignInUseCase: sl.call(), signOutUseCase: sl.call()));
  sl.registerFactory(() => AnimalsCubit(
      getAnimalsTypesUseCase: sl.call(),
      getAnimalsUseCase: sl.call(),
      searchAnimalsUseCase: sl.call(),
      deleteAnimalUseCase: sl.call()));
  sl.registerFactory(() => AnimalsFormCubit(
      updateAnimalUseCase: sl.call(), createAnimalUseCase: sl.call()));

  // USE CASE
  // =============================================================================
  // User
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));

  //Animal
  sl.registerLazySingleton(() => CreateAnimalUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateAnimalUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetAnimalsUseCase(
      animalRepository: sl.call(), authRepository: sl.call()));
  sl.registerLazySingleton(() => DeleteAnimalUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SearchAnimalsUseCase(
      animalRepository: sl.call(), authRepository: sl.call()));

  //Animal Type
  sl.registerLazySingleton(() => GetAnimalsTypesUseCase(
      animalRepository: sl.call(), animalTypeRepository: sl.call()));

  // REPOSITORY
  // =============================================================================
  //Account
  sl.registerLazySingleton<AuthRepository>(() => UserRepositoryImpl());
  //Animal
  sl.registerLazySingleton<AnimalRepository>(() => AnimalRepositoryImpl());
  //Animal Type
  sl.registerLazySingleton<AnimalTypeRepository>(
      () => AnimalTypeRepositoryImpl());
}
