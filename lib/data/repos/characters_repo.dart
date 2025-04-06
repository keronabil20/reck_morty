import 'package:reck_morty/data/models/character.dart';
import 'package:reck_morty/data/web/characters_web_services.dart';

class CharactersRepo {
  final CharactersWebServices charactersWebServices;

  CharactersRepo({required this.charactersWebServices});
  Future<List<Character>> getCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((characters) => Character.fromJson(characters))
        .toList();
  }
}