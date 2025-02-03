
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/cubit/my_rentals_cubit.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/screens/my_rentals_screen.dart';

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
      

      default:
        return null;
    }
  }
}
