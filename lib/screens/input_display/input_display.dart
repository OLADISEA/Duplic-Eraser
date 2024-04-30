import 'package:duplic_eraser/screens/input_display/bloc/input_display_bloc.dart';
import 'package:duplic_eraser/screens/input_display/bloc/input_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/widgets/widget.dart';
import 'bloc/input_display_events.dart';

class DisplayUserInputs extends StatefulWidget {
  const DisplayUserInputs({super.key});

  @override
  State<DisplayUserInputs> createState() => _DisplayUserInputsState();
}

class _DisplayUserInputsState extends State<DisplayUserInputs> {
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    //This will trigger the fetchInputEvent when the page first loads
    context.read<InputDisplayBloc>().add(FetchInputsEvent());
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.h,left: 31.w,right: 31.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backArrow(context),
                SizedBox(width: 90.w,),
                reusableText(text: "History",fontSize: 20.sp)
              ],
            ),
          ),//An arrow to go back to the first page
          Divider(
            thickness: 2,
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 31.w,right: 31.w),
            child: reusableText(text: "The entire strings entered are displayed below:",fontSize: 24.sp),
          ),
          SizedBox(height: 10.h,),
          // BlocBuilder to build UI based on InputDisplayBloc state
          BlocBuilder<InputDisplayBloc, InputDisplayState>(
                    builder: (BuildContext context, state) {
                      if (state.userInputs.isEmpty) {
                        // Display a loading indicator if userInputs list is empty
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.userInputs.length,
                            itemBuilder: (context, index) {
                              final userInputs = state.userInputs.reversed.toList();
                              final userInput = userInputs[index];
                              return Container(
                                margin: EdgeInsets.only(top: 10.h,left: 31.w,right: 31.w),
                                height: 50.h,
                                child: Card(
                                  elevation: 4.5,
                                  shadowColor: Colors.grey.withOpacity(0.8),
                                  // Display user input text
                                  child: Center(child: reusableText(
                                      text: userInput.inputString,
                                      fontSize: 20.sp)),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }),
        ],
      )
    );
  }
}
