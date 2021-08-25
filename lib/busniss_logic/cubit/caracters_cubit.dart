import 'package:bloc/bloc.dart';
import '../../data/model/caracters.dart';
import '../../data/repository/characters_rebository.dart';
import 'package:meta/meta.dart';

part 'caracters_state.dart';

class CaractersCubit extends Cubit<CaractersState> {
  final CharactersRebository charactersRebository;
  List<Character> characters;
  CaractersCubit(this.charactersRebository) : super(CaractersInitial());
  List<Character> getAllCharacters() {
    charactersRebository.getAllChatacters().then((character) {
      emit(ChractersLoaded(characters: character));
      this.characters = characters;
    });
    return characters;
  }
}
