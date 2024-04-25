class InputState{}

class InputSuccess extends InputState{
  final String inputString;
  InputSuccess({this.inputString = ""});
}
class UpdatedStringState extends InputState{
  final List<String> characters;
  final bool isDuplicate;
  UpdatedStringState({required this.characters, required this.isDuplicate});
}

class InputError extends InputState{
  final String alphabetError;
  final String emptyStringError;

  InputError({this.alphabetError = "", this.emptyStringError=""});
}
// class RemoveDuplicateState extends InputState{}