import 'package:flutter/material.dart';
import 'package:reck_morty/constants/strings.dart';
import 'package:reck_morty/presentation/screens/detailed_characters.dart';
import 'presentation/screens/characters.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());

      case detailedCharacters:
        return MaterialPageRoute(builder: (_) => const DetailedCharacters());
    }

    return null;
  }
}
