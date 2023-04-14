import 'package:get_it/get_it.dart';
import 'package:ui_intern/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:ui_intern/ulti/controller/loading_cover_controller.dart';

import '../../../presentation/bloc/authentication/login/login_cubit.dart';

Future<void> configureDependencies() async {
  GetIt.instance
      .registerLazySingleton<AuthenticationCubit>(() => AuthenticationCubit());
  GetIt.instance.registerLazySingleton<LoginCubit>(() => LoginCubit());

  GetIt.instance.registerLazySingleton<LoadingCoverController>(
      () => LoadingCoverController());
}
