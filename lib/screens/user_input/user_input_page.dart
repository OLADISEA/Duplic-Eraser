import 'package:duplic_eraser/screens/bloc/input_bloc.dart';
import 'package:duplic_eraser/screens/bloc/input_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/widgets/widget.dart';
import '../bloc/input_states.dart';
import '../duplicate_remover/remover_duplicate.dart';

class UserInputPage extends StatelessWidget {
  UserInputPage({super.key});

  // Text editing controller and focus node for input field
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  // Error text to display validation errors
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<InputBloc,InputState>(
          builder: (BuildContext context, state) {
            return Container(
              margin: EdgeInsets.only(top: 100.h,left: 39.w,right: 34.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and logo
                  titlePage(text: "Duplic Eraser", image: "assets/logo/duplic_logo.png"),
                  SizedBox(height: 120.h,),
        
                  reusableText(text: "Input Field",fontSize: 14.sp),
        
                  // Input field widget
                  textField(
                      text: "Enter alphabet characters only",
                      controller: controller,
                      focusNode: focusNode,
                      onChangedValue: () {
        
                        // Notify bloc to confirm alphabet characters only
                        context.read<InputBloc>().add(ConfirmAlphabetEvents(characters: controller.text.toLowerCase()));
                      }),
                  SizedBox(height: 5.h,),
                  // Error text display
                  reusableText(text: errorText,color: Colors.red),
                  SizedBox(height: 20.h,),
                // Submit button
                generalButton(text: "Submit", onTap: (){
        
                  // Notify bloc that submit button is pressed
                  context.read<InputBloc>().add(SubmitButtonPressed(input: controller.text));
                })
              ]
            ));
          },
          listener: (BuildContext context, Object? state) {
            // If input is successful, navigate to RemoveDuplicate screen
            if(state is InputSuccess){
              String userInput = controller.text;
              controller.clear();
              focusNode.unfocus();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RemoveDuplicate(originalString: userInput,)));
        
            }
            // Show toast message if input is empty
            if(state is InputError && state.emptyStringError.isNotEmpty){
              Fluttertoast.showToast(
                  msg: state.emptyStringError,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 12.sp
              );
            }
            // Show error message if input contains non-alphabet characters
            if(state is InputError && state.alphabetError.isNotEmpty){
              errorText = "The Field must consist of only alphabets";
            }
            // Clear error text if input is valid
            if(state is InputError && state.alphabetError.isEmpty){
              errorText = "";
            }
          },
        ),
      ),
    );
  }
}
