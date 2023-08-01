//!وما سوف يحصل بها State تحديد 

part of 'characters_cubit.dart';


@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

//! loaded
class CharactersLoaded extends CharactersState {
  final List<Characters1> character;
  CharactersLoaded(this.character);
}

//! Search
class CharactersSearch extends CharactersState {
  final List<Characters1> serchedForCharacters;
  CharactersSearch(this.serchedForCharacters);
}

//! GetAdvice
// ignore: must_be_immutable
class QuatoString extends CharactersState {
  String? advice ;
  QuatoString(this.advice);
}

class CharactersErrorCase extends CharactersState{}