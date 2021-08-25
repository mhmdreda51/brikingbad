import 'busniss_logic/cubit/caracters_cubit.dart';
import 'constans/strings.dart';
import 'data/api_services/characters_api_services.dart';
import 'data/repository/characters_rebository.dart';
import 'presentaion/screen/caracters_details_screen.dart';
import 'presentaion/screen/caracters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/model/caracters.dart';

class AppRouter {
  CaractersCubit caractersCubit;
  CharactersRebository charactersRebository;
  AppRouter() {
    charactersRebository =
        CharactersRebository(charactersApiServices: CharactersApiServices());
    caractersCubit = CaractersCubit(charactersRebository);
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case caractersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CaractersCubit(charactersRebository),
                  child: CharactersScreen(),
                ));
      case caractersDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CaractersCubit(charactersRebository),
                  child: CaractersDetailsScreen(
                    character: character,
                  ),
                ));
    }
  }
}
