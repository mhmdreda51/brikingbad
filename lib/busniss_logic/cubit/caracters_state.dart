part of 'caracters_cubit.dart';

@immutable
abstract class CaractersState {}

class CaractersInitial extends CaractersState {}

class ChractersLoaded extends CaractersState {
  final List<Character> characters;

  ChractersLoaded({this.characters});
}
