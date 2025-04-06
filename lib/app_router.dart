import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reck_morty/constants/strings.dart';
import 'package:reck_morty/data/repos/characters_repo.dart';
import 'package:reck_morty/data/web/characters_web_services.dart';
import 'package:reck_morty/logic/cubit/characters_cubit.dart';
import 'package:reck_morty/presentation/screens/detailed_characters.dart';
import 'presentation/screens/characters.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo =
        CharactersRepo(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: const CharactersScreen(),
                ));

      case detailedCharacters:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: const DetailedCharacters(),
                ));
    }
    return null;
  }
}
