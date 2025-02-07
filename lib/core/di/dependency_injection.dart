import 'package:get_it/get_it.dart';
import 'package:parotia_task/core/firebase/firabase_crud_manager.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/features/owner/my_rentals/domain/usecases/get_all_rental_use_case.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/cubit/my_rentals_cubit.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/cubit/visitor_home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  // getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<GetAllRentalsUseCase>(
      () => GetAllRentalsUseCase(getIt()));

  getIt.registerFactory<FirestoreCrudManager<ReservationModel>>(() =>
      FirestoreCrudManager<ReservationModel>(
          collectionPath: 'reservations',
          fromFirestore: (docSnapshot) =>
              ReservationModel.fromFirestore(docSnapshot),
          toFirestore: (reservationModel) => reservationModel.toFirestore()));
  // getIt.registerLazySingleton<MyRentalRepository>(
  //     () => MyRentalRepositoryImpl());

  // getIt.registerLazySingleton<GetAllRentalsUseCase>(
  //     () => GetAllRentalsUseCase(getIt()));

  // getIt.registerLazySingleton<ScanRepo>(() => ScanRepo(getIt()));
// Cubits
  getIt.registerFactory<MyRentalsCubit>(() => MyRentalsCubit(getIt()));
  getIt.registerFactory<VisitorHomeCubit>(() => VisitorHomeCubit(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
