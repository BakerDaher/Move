import 'package:move/data/models/Characters.dart';
import 'package:move/data/web_services/characters_api.dart';

class CharactersRepos {
  //! in Internet
  final CharactersApi charactersApi;

  //! in Local Data
  //final CharactersLocal charactersLocal ;

  CharactersRepos(this.charactersApi);

  // Local or API هندلة من
  Future<List<Characters1>> getAllCharacters() async {
    // git data in APi Or Local
    final List<dynamic> characters = await charactersApi.getAllCharacters();
    return characters.map(
      //? convert in json to Model >> dart
      (character) => Characters1.fromJson(character) 
    ).toList();
  }
}
