import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/cubits/edit_calender_cubit/edit_calender_cubit.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/cubits/edit_price_cubit/edit_price_cubit.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/screens/edit_availability_screen.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/screens/edit_calender_screen.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/screens/edit_price_screen.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/cubit/my_rentals_cubit.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/screens/my_rentals_screen.dart';

import '../../features/owner/edit_calender/presentation/cubits/edit_availability_cubit/edit_availability_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.myRentalsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MyRentalsCubit>(),
            child: const MyRentalsScreen(),
          ),
          settings: settings,
        );
      case Routes.editCalenderScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditCalenderCubit>(),
            child: const EditCalenderScreen(),
          ),
          settings: settings,
        );
      case Routes.editPriceScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditPriceCubit>(),
            child: const EditPriceScreen(),
          ),
          settings: settings,
        );
      case Routes.editAvailabilityScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditAvailabilityCubit>(),
            child: const EditAvailabilityScreen(),
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
