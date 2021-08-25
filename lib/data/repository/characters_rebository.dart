import '../api_services/characters_api_services.dart';
import '../model/caracters.dart';

class CharactersRebository {
  final CharactersApiServices charactersApiServices;

  CharactersRebository({this.charactersApiServices});
  Future<List<Character>> getAllChatacters() async {
    final characters = await charactersApiServices.getAllChatacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
