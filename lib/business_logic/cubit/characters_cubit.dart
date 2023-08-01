//! العمل عليه
//?   Local or API بعد أن أخذ من  Repo يأخذ من ملف

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:move/data/models/Characters.dart';
import 'package:move/data/repository/Characters_repository.dart';
// import 'package:test_bloc/data/repository/Quato_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  List<Characters1>? characters1; //! all Characters

  // ignore: non_constant_identifier_names
  //!    للعمل عليه repo منObject حجز
  final CharactersRepos charactersRepos;
  // final QuatoRepos quatoRepos;

  
  CharactersCubit(this.charactersRepos) : super(CharactersInitial());

  //  emait in repo , List<Characters1>?
  void getAllCharacters() {
    // return of List Characters to (emit) > State > CharactersLoaded
    charactersRepos.getAllCharacters().then((characters) {
      //!المعنى للكلمة emit >> ينبعث / ينطلق / إبدا
      emit(CharactersLoaded(characters)); //State يرسل إلى
      this.characters1 = characters;
    });
  }

  //! Methode search in All characters by name Character
  void addSearchedOrItemSearchedList(String searchCharacter) {
    //? filter in allCharacter
    List<Characters1>? serchedForCharacters;
    // ignore: unnecessary_null_comparison
    if (searchCharacter == null) {
      emit(CharactersLoaded(characters1!));
    } else {
      serchedForCharacters = characters1!
          .where((character) => character.name
              .toLowerCase()
              .startsWith(searchCharacter.toLowerCase()))
          .toList();

      emit(CharactersSearch(serchedForCharacters));
    }
  }

}
