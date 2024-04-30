import 'package:duplic_eraser/database/user_input_db.dart';
import 'package:duplic_eraser/screens/input_display/bloc/input_display_events.dart';
import 'package:duplic_eraser/screens/input_display/bloc/input_display_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDisplayBloc extends Bloc<InputDisplayEvents, InputDisplayState> {
  final UserInputDatabase userInputDatabase;

  InputDisplayBloc({required this.userInputDatabase}):super(InputDisplayState([])){

  on<FetchInputsEvent>((event, emit) async{
    //fetch all the user inputs from the database
    await userInputDatabase.fetchUserInputs();

    // Emit the updated state with fetched user inputs
    emit(InputDisplayState(userInputDatabase.currentInputList));

  });
  }
}