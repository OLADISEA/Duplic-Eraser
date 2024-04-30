class InputEvents{}

class SubmitButtonPressed extends InputEvents{
  final String input;
  SubmitButtonPressed({required this.input});
}

class CheckDuplicateEvents extends InputEvents{
  final List<String> characters;
  CheckDuplicateEvents({required this.characters});
}
class RemoveDuplicateEvents extends InputEvents{
  final String char;
  final List<String> characters;
  final int index;
  RemoveDuplicateEvents({required this.char, required this.characters,required this.index});
}

class ConfirmAlphabetEvents extends InputEvents{
  final String characters;
  ConfirmAlphabetEvents({required this.characters});
}

class StoreInputEvents extends InputEvents{
  final String userInputs;
  StoreInputEvents({required this.userInputs});
}