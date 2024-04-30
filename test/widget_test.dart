import 'package:duplic_eraser/components/widgets/widget.dart';
import 'package:duplic_eraser/database/user_input_db.dart';
import 'package:duplic_eraser/screens/bloc/input_bloc.dart';
import 'package:duplic_eraser/screens/duplicate_remover/remover_duplicate.dart';
import 'package:duplic_eraser/screens/input_display/bloc/input_display_bloc.dart';
import 'package:duplic_eraser/screens/user_input/user_input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Testing for a reusable text widget
  testWidgets('Duplic Eraser', (WidgetTester tester) async {
    // Pump the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: reusableText(text: 'Hello World', fontSize: 20, color: Colors.blue),
      ),
    ));

    // Finding the Text widget and check its style
    final textWidget = tester.widget<Text>(find.text('Hello World'));
    expect(textWidget.style!.fontSize, 20);
    expect(textWidget.style!.color, Colors.blue);
  });

  // Testing for the Bloc functionality
  testWidgets('Test Bloc', (WidgetTester tester) async {
    // Pump the widget with MultiBlocProvider
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<InputBloc>(
            create: (_) => InputBloc(userInputDatabase: UserInputDatabase()),
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: UserInputPage(),
          ),
        ),
      ),
    );

    // Find widgets by their types or keys and interact with them
    expect(find.text('Duplic Eraser'), findsOneWidget); // Check if the title is displayed
    expect(find.byType(TextField), findsOneWidget); // Check if the input field is displayed

    // Simulate user actions, like tapping a button or entering text
    await tester.enterText(find.byType(TextField), 'Test Input');
    await tester.tap(find.text('Submit'));

    // Pump the RemoveDuplicate widget with a test string
    String inputString = "Test String";
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<InputBloc>(
            create: (_) => InputBloc(userInputDatabase: UserInputDatabase()),
          ),
          BlocProvider<InputDisplayBloc>(
            create: (_) => InputDisplayBloc(userInputDatabase: UserInputDatabase()),
          ),
        ],
        child: MaterialApp(
          home: Column(
            children: [
              Expanded(
                  child: RemoveDuplicate(originalString: inputString)),
            ],
          ),
        ),
      ),
    );

    print('App widget pumped.');
  });



  print('Test completed.');
}
