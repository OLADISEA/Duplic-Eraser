import 'package:duplic_eraser/screens/bloc/input_bloc.dart';
import 'package:duplic_eraser/screens/user_input/user_input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(

      BlocProvider(
          create: (context) => InputBloc(),
          child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserInputPage(),
      ),
    );
  }
}
