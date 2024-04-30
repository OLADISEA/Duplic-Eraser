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
      backgroundColor: const Color(0XFFFAFAFA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.h,left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backArrow(context),//An arrow to go back to the first page
                SizedBox(width: 80.w,),
                reusableText(text: "History",fontSize: 24.sp,fontWeight: FontWeight.w700)
              ],
            ),
          ),
          Container(
              child: appDivider()),
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
                          child: ListView.separated(
                            itemCount: state.userInputs.length,
                            separatorBuilder: (context, index) => const Divider(),
                            itemBuilder: (context, index) {
                              final userInputs = state.userInputs.reversed.toList();
                              final userInput = userInputs[index];
                              return Container(
                                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                                height: 45.h,
                                child: Center(child: reusableText(
                                    text: userInput.inputString,
                                    fontSize: 20.sp)),
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
