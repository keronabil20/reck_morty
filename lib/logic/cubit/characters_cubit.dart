import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reck_morty/data/models/character.dart';
import 'package:reck_morty/data/repos/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<dynamic> characters = [];
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<dynamic> getAllCharacters() {
    charactersRepo.getCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
