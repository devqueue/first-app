import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firstapp/common/routes/routes.dart';
import 'package:firstapp/common/values/colors.dart';
import 'package:firstapp/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: ((context, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: AppColors.primaryBackground,
                ),
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppPages.generateRouteSettings,
            )),
      ),
    );
  }
}