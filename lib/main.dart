import 'package:duplic_eraser/screens/bloc/input_bloc.dart';
import 'package:duplic_eraser/screens/input_display/bloc/input_display_bloc.dart';
import 'package:duplic_eraser/screens/user_input/user_input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'database/user_input_db.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserInputDatabase.initialize();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => InputBloc(userInputDatabase: UserInputDatabase()),),
          BlocProvider(create: (context) => InputDisplayBloc(userInputDatabase: UserInputDatabase()),)
        ],
          child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Using screen util for responsiveness
    return ScreenUtilInit(
      designSize: const Size(360, 690), // design size
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserInputPage(),
      ),
    );
  }
}
