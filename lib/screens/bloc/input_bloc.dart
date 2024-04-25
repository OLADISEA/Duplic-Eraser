import 'package:duplic_eraser/screens/bloc/input_events.dart';
import 'package:duplic_eraser/screens/bloc/input_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputBloc extends Bloc<InputEvents,InputState>{
  InputBloc():super(InputState()){
    on<SubmitButtonPressed>(_validateInput);

    on<ConfirmAlphabetEvents>((event,emit){
        bool isAlphabet = _isAlphabet(event.characters);
        if(!isAlphabet){
          emit(InputError(alphabetError: "Characters must be an Alphabet"));
        }else{
          print("It is totally an alphabet");
          emit(InputError(alphabetError: ""));

        }
    });


    on<RemoveDuplicateEvents>((event, emit){
      List<String> myList = event.characters;
      String myChar = event.char;
      print(event.index);
      //int occurence = myList.where((element) => element == myChar).length;
      List<String> newList = [];
      for(int i = 0; i < myList.length; i++){
        if((myList[i] != myChar || i == event.index)){
          newList.add(myList[i]);
        }
      }
      print('The new list is $newList');
      bool isDuplicate = checkDuplicate(newList);
      print("The duplicate in the bloc state is $isDuplicate");
      //emit updated string state
      emit(UpdatedStringState(characters: newList,isDuplicate: isDuplicate));


    });
  }

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

  bool checkDuplicate(List<String> originalList){
    // Create a set to store unique characters encountered so far
    List<String> seen = [];
    // Iterate through each character in the string
    for (int i = 0; i < originalList.length; i++) {
      String char = originalList[i];

      // If the character is already in the set, it's a duplicate
      if (seen.contains(char)) {
        return true; // String has duplicates
      } else {
        seen.add(char); // Add the character to the set
      }
    }

    // If we reach here, there are no duplicates
    return false;
  }



  bool _isAlphabet(String value) {
    final RegExp regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(value);
  }
}
