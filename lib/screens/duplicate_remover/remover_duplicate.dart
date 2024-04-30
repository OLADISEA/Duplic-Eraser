import 'package:audioplayers/audioplayers.dart';
import 'package:duplic_eraser/screens/bloc/input_events.dart';
import 'package:duplic_eraser/screens/input_display/input_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../components/widgets/widget.dart';
import '../bloc/input_bloc.dart';
import '../bloc/input_states.dart';

class RemoveDuplicate extends StatefulWidget {
  final String originalString;
  const RemoveDuplicate({required this.originalString,super.key});

  @override
  State<RemoveDuplicate> createState() => _RemoveDuplicateState();
}

class _RemoveDuplicateState extends State<RemoveDuplicate> {
  TextEditingController controller = TextEditingController();

  List<String> characters = [];// Stores characters of the string
  String userInput = ''; // Stores the original user input
  String modifiedString = ''; // Stores the modified string after duplicate removal
  bool allDuplicateRemoved = false;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    '''The reason for this is to detect scenarios where the user entered strings without duplicates.
    The first character in the string is accessed and we will try to remove it and call the duplicate 
    function in the bloc state which will in turn check if there is any duplicate character left''';
    context.read<InputBloc>().add(CheckDuplicateEvents(
        characters: widget.originalString.split(""),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();// Dispose audio player when done
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFAFAFA),
        body: SingleChildScrollView(
          child: BlocConsumer<InputBloc,InputState>(
            builder: (BuildContext context, InputState state) {
              if(state is InputSuccess){
                userInput = state.inputString;//getting the user input value
                modifiedString = state.inputString;// getting the modified string value
                //converting the characters to a list so that each can be separated in a card
                characters = state.inputString.split("");
              }
              if(state is UpdatedStringState){
                print("The state is updated string state");
                //converting the character back to a list on storing it in the modified sting variable
                modifiedString = state.characters.join();
                characters = state.characters;//access the characters from the state
                allDuplicateRemoved = !state.isDuplicate;// Update flag based on state
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h,left: 24.w,right: 24.w),
                    child: Row(
                      children: [
                        backArrow(context),
                        SizedBox(width: 50.w,),
                        reusableText(text: "Duplic Eraser",fontSize: 27.sp,fontWeight: FontWeight.w800)
                      ],
                    ),
                  ),
                 appDivider(),// A custom widget for back button
                  Container(
                    margin: EdgeInsets.only(top: 15.h,left: 24.w,right: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        informationText(userInput: userInput,modifiedString: modifiedString),
                        SizedBox(height: 20.h,),
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 15.w,
                          children: characters.asMap().entries.map((entry) {
                            final int index = entry.key;
                            final char = entry.value;
                            return charactersCard(
                              characters: characters,
                              char: char,
                              allDuplicateRemoved: allDuplicateRemoved,
                              onTap: ()
                            {
                              //Trigger the remove duplicate events to remove duplicate if any whenever a card is pressed
                              context.read<InputBloc>().add(
                                  RemoveDuplicateEvents(
                                      char: char,
                                      characters: characters,
                                      index: index
                                  )
                              );
                            });

                          }).toList(),

                        ),
                      ],
                    ),
                  ),

                ],
              );
            },
            listener: (BuildContext context, state) async{
              if(state is UpdatedStringState && !state.isDuplicate){
                //  Display a toast message when there is no duplicate remaining
                  Fluttertoast.showToast(
                      msg: "All Duplicates have been removed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      fontSize: 16.0.sp
                  );
                  //Store the user input to the database
                  context.read<InputBloc>().add(StoreInputEvents(userInputs: userInput));
                  //Play an audio after the duplicate has been removed
                  await player.play(AssetSource("audio/faded.mp3"));
                  // Delay navigation for 3 seconds
                  await Future.delayed(const Duration(seconds: 4));
                  // Navigate to the screen where all the user inputs ever entered will be displayed
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const DisplayUserInputs()),
                  );
                }
          
              }

          ),
        ),
      ),
    );
  }
}
