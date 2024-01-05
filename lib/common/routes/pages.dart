import 'package:firstapp/common/routes/names.dart';
import 'package:firstapp/pages/welcome/bloc/welcome_blocs.dart';
import 'package:firstapp/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages{

  static List<PageEntity> routes() {
      return [
        PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc() )
          )
      ];
  }

  // unexplained
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }

    return blocProviders;
  }
  
    // model that covers entire  screen
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    var result = routes().where((element) => element.route == settings.name);
    return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
    // if (settings.name != null) {
    //   // Check if route name matches when navigator is triggered
    //   var result = routes().where((element) => element.route == settings.name);
    //   if (result.isNotEmpty) {
    //     // bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

    //     /* if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
    //       bool isLoggedIn = Global.storageService.getIsLoggedIn();

    //       if (isLoggedIn) {
    //         return MaterialPageRoute(
    //             builder: (_) => const ApplicationPage(), settings: settings);
    //       }
    //       return MaterialPageRoute(
    //           builder: (_) => const SignIn(), settings: settings);
    //     }*/

    //     return MaterialPageRoute(
    //         builder: (_) => result.first.page, settings: settings);
    //   }
    // }
    // return MaterialPageRoute(
    //     builder: (_) => const SignIn(), settings: settings);
  }
}



class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
