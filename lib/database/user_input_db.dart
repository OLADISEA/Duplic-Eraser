import 'package:duplic_eraser/model/user_input_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UserInputDatabase extends ChangeNotifier{
  static late Isar isar;


  //Initialize
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([UserInputSchema], directory: dir.path);
  }



  //CRUD OPERATIONS

  //List of strings entered by the user
  final List<UserInput> currentInputList = [];

  //Add a new input
  Future<void> addUserInput(String userInput) async{

    // create a variable to store the new input
    final currentInput = UserInput()..inputString = userInput;

    //save it to the database
    await isar.writeTxn(() => isar.userInputs.put(currentInput));

    //Fetch the strings from the database
    fetchUserInputs();
  }

  Future<void> fetchUserInputs()async{
    //fetch the string first from the database
    List<UserInput> fetchHabits = await isar.userInputs.where().findAll();

    //save it to the current input list
    currentInputList.clear();
    currentInputList.addAll(fetchHabits);

    //update UI
    notifyListeners();
  }



  //Update - edit user input
  Future<void> updateUserInput(int id, String newName) async{
    // find the specific user input string using the id
    final userInput = await isar.userInputs.get(id);

    //update userInput
    if(userInput != null){
      // update name
      await isar.writeTxn(() async{
        userInput.inputString = newName;

        //save the updated user input back to the database
        await isar.userInputs.put(userInput);
      });
    }

    // fetch the entire user Inputs from the database
    fetchUserInputs();
  }

  //Delete UserInput
  // Future<void> deleteHabit(int id) async{
  //   await isar.writeTxn(() async{
  //     await isar.userInputs.delete(id);
  //   });
  //
  //   //re-read from the database
  //   fetchUserInputs();
  //}
}