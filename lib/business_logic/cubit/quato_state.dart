part of 'quato_cubit.dart';

@immutable
abstract class QuatoState {}

class QuatoInitial extends QuatoState {}

class QuatoGetAdvice extends QuatoState{
  final String? advice ;
  QuatoGetAdvice(this.advice) ;
}