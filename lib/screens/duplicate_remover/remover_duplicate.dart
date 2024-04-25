import 'package:audioplayers/audioplayers.dart';
import 'package:duplic_eraser/common/widgets/widget.dart';
import 'package:duplic_eraser/screens/bloc/input_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../bloc/input_bloc.dart';
import '../bloc/input_states.dart';

class RemoveDuplicate extends StatefulWidget {
  RemoveDuplicate({super.key});

  @override
  State<RemoveDuplicate> createState() => _RemoveDuplicateState();
}

class _RemoveDuplicateState extends State<RemoveDuplicate> {
  TextEditingController controller = TextEditingController();

  List<String> characters = [];

  final player = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  // void removeDuplicates(String pressedChar){
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            backArrow(context),
            reusableText(text: "Here, you can click on any duplicate string you will like to remove",fontSize: 19.sp),
            BlocConsumer<InputBloc,InputState>(

              builder: (BuildContext context, InputState state) {

                if(state is InputSuccess){
                  print("The state is true");

                  characters = state.inputString.split("");
                  print("The actual char is $characters");

                }
                if(state is UpdatedStringState){
                  print("The state is very true");

                  characters = state.characters;
                  print("The actual char is $characters");
                }
                return Column(
                  children: [
                    SizedBox(height: 50,),
                    Wrap(
                      spacing: 5.0,
                      runSpacing: 8.0,
                      children: characters.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final char = entry.value;
                        //print(char);
                        return GestureDetector(
                          onTap: (){
                            print("pressed");
                            context.read<InputBloc>().add(RemoveDuplicateEvents(
                                char: char,
                                characters: characters,
                                index: index
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 28.w),
                            width: 50.w,
                            height: 40.h,
                            child: Card(
                              color: Colors.purple,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: reusableText(text: char,color: Colors.white,fontSize: 18.sp)),
                              ),
                            ),
                          ),
                        );

                      }).toList(),

                    ),
                  ],
                );
              },
              listener: (BuildContext context, state) async{
                if(state is UpdatedStringState){
                  print("Updated String State");
                  final checkDuplicate = state.isDuplicate;
                  if(!checkDuplicate){
                    print("All duplicate removed");
                    Fluttertoast.showToast(
                        msg: "All Duplicates have been removed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    await player.play(AssetSource("audio/faded.mp3"));
                  }

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
