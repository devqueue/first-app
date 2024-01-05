import 'package:firstapp/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocProviders {
    static get allBlocProviders => [
      BlocProvider(create: (context) => WelcomeBloc()),
    ];
}