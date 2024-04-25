import 'package:duplic_eraser/common/widgets/widget.dart';
import 'package:duplic_eraser/screens/bloc/input_bloc.dart';
import 'package:duplic_eraser/screens/bloc/input_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/input_states.dart';
import '../duplicate_remover/remover_duplicate.dart';

class UserInputPage extends StatelessWidget {
  UserInputPage({super.key});

  final TextEditingController controller = TextEditingController();
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocConsumer<InputBloc,InputState>(

          builder: (BuildContext context, state) {
            return Container(
              margin: EdgeInsets.only(top: 50.h,left: 24.w,right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText(text: "Welcome to String Duplicate Remover",fontSize: 22.sp,fontWeight: FontWeight.w700),
                  SizedBox(height: 150.h,),
                  //SizedBox(height: 24.h,),
                  reusableText(text: "Input Field",fontSize: 14.sp),
                  textField(text: "Enter alphabet characters only", controller: controller, onChangedValue: () {
                    print(controller.text);
                    context.read<InputBloc>().add(ConfirmAlphabetEvents(characters: controller.text));
                  }),
                  reusableText(text: errorText,color: Colors.red),
                  SizedBox(height: 30.h,),
                  generalButton(text: "Submit", onTap: (){
                    context.read<InputBloc>().add(SubmitButtonPressed(input: controller.text));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RemoveDuplicate()));
                  })
                ],
              ),
            );
          },
          listener: (BuildContext context, Object? state) {
            if(state is InputSuccess){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RemoveDuplicate()));

            }
            if(state is InputError && state.emptyStringError.isNotEmpty){
              Fluttertoast.showToast(
                  msg: "An error occurred: ${state.emptyStringError}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            if(state is InputError && state.alphabetError.isNotEmpty){
              errorText = "The Field must consist of only alphabets";
            }
            if(state is InputError && state.alphabetError.isEmpty){
              errorText = "";
            }
          },
        ),
      ),
    );
  }
}
