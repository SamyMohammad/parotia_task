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
import 'package:parotia_task/features/vendors_screen.dart';
import 'package:parotia_task/features/visitor/property_details/presentation/cubit/property_details_cubit.dart';
import 'package:parotia_task/features/visitor/property_details/presentation/pages/success_screen.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/cubit/visitor_home_cubit.dart';

import '../../features/owner/edit_calender/presentation/cubits/edit_availability_cubit/edit_availability_cubit.dart';
import '../../features/visitor/property_details/presentation/pages/property_details_screen.dart';
import '../../features/visitor/visitor_home/presentation/screens/visitor_home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.myRentalsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<MyRentalsCubit>()..fetchAllReservations(),
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
      case Routes.visitorHomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VisitorHomeCubit>(),
            child: const VisitorHomeScreen(),
          ),
          settings: settings,
        );
      case Routes.propertyDetailsScreen:
        final propertyDetailsScreenArgs =
            settings.arguments as PropertyDetailsScreenArgs;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PropertyDetailsCubit>(),
            child: PropertyDetailsScreen(
              args: propertyDetailsScreenArgs,
            ),
          ),
          settings: settings,
        );
      case Routes.successScreen:
        return MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
          settings: settings,
        );
      case Routes.vendorsScreen:
        return MaterialPageRoute(
          builder: (_) => const VendorsScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
