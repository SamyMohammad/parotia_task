import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/core/helpers/navigator_helper.dart';
import 'package:parotia_task/core/router/app_router.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp(appRouter: AppRouter()));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;

  const MainApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorkey,
          title: 'Bawabat',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.vendorsScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
