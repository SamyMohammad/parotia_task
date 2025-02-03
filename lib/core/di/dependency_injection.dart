import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  // getIt.registerLazySingleton<NavigationService>(() => NavigationService());

  // getIt.registerLazySingleton<ScanRepo>(() => ScanRepo(getIt()));
// Cubits
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
