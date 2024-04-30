import 'package:duplic_eraser/screens/bloc/input_events.dart';
import 'package:duplic_eraser/screens/bloc/input_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/user_input_db.dart';

class InputBloc extends Bloc<InputEvents,InputState>{
  final UserInputDatabase userInputDatabase;
  InputBloc({required this.userInputDatabase}):super(InputState()){

    // Handles SubmitButtonPressed event
    on<SubmitButtonPressed>(_validateInput);

    on<ConfirmAlphabetEvents>((event,emit){
        bool isAlphabet = _isAlphabet(event.characters.trim());
        if(!isAlphabet){
          //This indicates that one or more characters is(are) not an alphabet(s)
          emit(InputError(alphabetError: "Characters must be an Alphabet"));
        }else{
          //This indicates that the characters is an alphabet
          emit(InputError(alphabetError: ""));

        }
    });

    //This removes the duplicate whenever the user clicks on a card having a duplicate
    on<RemoveDuplicateEvents>(_updateUI);

    //This confirms if there is a duplicate at the init state of the second page
    // and if there isn't, it will navigate to the third page
    on<CheckDuplicateEvents>(_checkDuplicateAtInitialization);


    //This stores the input to the isar database
    on<StoreInputEvents>((event, emit) async{
      await userInputDatabase.addUserInput(event.userInputs);
    });
  }


  //A function for user input validation
  void _validateInput(SubmitButtonPressed events, Emitter<InputState> emit){
    if(events.input.isNotEmpty && _isAlphabet(events.input)){
      emit(InputSuccess(inputString: events.input));
    }else if(events.input.isNotEmpty && !_isAlphabet(events.input)){
      emit(InputError(alphabetError: "Characters must be an Alphabet"));
    }
    else{
      emit(InputError(emptyStringError: 'The Input field cannot be empty'));
    }
  }


  //This function check if there exists duplicate characters in the string
  bool checkDuplicate(List<String> originalList){
    // Create a List to store unique characters encountered
    List<String> seen = [];
    // Iterate through each character in the string
    for (int i = 0; i < originalList.length; i++) {
      String char = originalList[i];

      // If the character is already in the List, it's a duplicate
      if (seen.contains(char)) {
        return true; // String has duplicates
      } else {
        seen.add(char); // Add the character to the List
      }
    }

    // If we reach here, it means that there are no duplicates
    return false;
  }


  //This function checks if the characters contains alphabet(s) only and returns a bool
  bool _isAlphabet(String value) {
    final RegExp regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(value);
  }


  // This function removes the duplicate when the user clicks on a card which has an associated duplicate
  List<String> _removeDuplicate(event, emit){
    List<String> myList = event.characters;
    String myChar = event.char;
    List<String> newList = [];
    //loop through the characters
    for(int i = 0; i < myList.length; i++){
      '''add the characters that are different from the 
      character selected and character itself. Any other character is a duplicate''';
      if((myList[i] != myChar || i == event.index)){
        newList.add(myList[i]);
      }
    }
    return newList;
  }
  //The update Ui function update the UI of the second page as the user clicks on any duplicate characters
  void _updateUI(RemoveDuplicateEvents event, Emitter<InputState> emit){
    List<String> newList = _removeDuplicate(event, emit);
    bool isDuplicate = checkDuplicate(newList);
    //emit updated string state
    emit(UpdatedStringState(characters: newList,isDuplicate: isDuplicate));
  }


  //This functions checks if any duplicate exists when the second page loads initially before the user taps on any card
  void _checkDuplicateAtInitialization(CheckDuplicateEvents event, Emitter<InputState> emit){
    List<String> newList = _removeDuplicate(event, emit);
    bool isDuplicate = checkDuplicate(newList);
    '''emit updated string state
    Here, the original list will be sent back to the state so that the value remains the same 
    before the user starts removing duplicate''';
    emit(UpdatedStringState(characters: event.characters,isDuplicate: isDuplicate));

  }


}
