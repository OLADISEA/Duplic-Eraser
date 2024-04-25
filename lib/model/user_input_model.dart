import 'package:isar/isar.dart';
part 'user_input_model.g.dart';


//flutter pub run build_runner build --delete-conflicting-outputs
@Collection()

class UserInput{
  Id id = Isar.autoIncrement;

  //user input string(The String of alphabets)
  late String inputString;

  //string left after user Tap on one or more cards
  late String stringLeft;
}