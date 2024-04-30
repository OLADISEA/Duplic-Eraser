# duplic_eraser

Duplic Eraser

This documentation provides an overview of the Duplic Eraser application, its features, components, and
dependencies. It serves as a guide for understanding the structure and functionality of the application.

Overview of Duplic Eraser

Duplic Eraser is a Flutter application designed to help users remove duplicate characters from strings. 
The application allows users to input strings, remove duplicate characters, and store the modified strings. 
It also provides features for managing and displaying user inputs.

Features
1. Remove Duplicate Characters: Users can input strings and remove duplicate characters from them.
2. Store Modified Strings: Modified strings with duplicate characters removed are stored in a database for future reference.
3. Display User Inputs: Users can view a list of all the strings they have entered previously.


Components
1. Screens
   a. User Input Screen
   Description: Allows users to input strings(String must only consist of alphabets
   and it must not be empty otherwise it will not proceed to the next page).
   File: user_input_page.dart
 
   b. RemoveDuplicate Screen
   Description: Allows users to remove duplicate characters, and view the modified string.
   File: remove_duplicate.dart


   c. DisplayUserInputs Screen
   Description: Displays a list of all user inputs stored in the database.
   File: display_user_inputs.dart


2. Bloc (Business Logic Component)
   a. InputBloc
   Description: Handles the business logic related to storing inputs and removing duplicate characters from strings.
   Files:
   input_bloc.dart
   input_states.dart
   input_events.dart
   b. InputDisplayBloc
   Description: Manages the state of the DisplayUserInputs screen and handles fetching user inputs from the database.
   Files:
   input_display_bloc.dart
   input_display_states.dart
   input_display_events.dart


3. Model
   a. UserInputModel
   Description: Defines the structure of the UserInput object stored in the database.
   File: user_input_model.dart


4. Database
   a. UserInputDatabase
   Description: Manages interactions with the database for storing and fetching user inputs.
   File: user_input_db.dart


5. Widgets
   Description: Contains reusable widgets used throughout the application.
   File: widget.dart


   Dependencies
   flutter_bloc: State management library for Flutter applications.
   flutter_screenutil: Flutter plugin for adapting screen and font size.
   fluttertoast: Flutter plugin for displaying toast notifications.
   audioplayers: Flutter plugin for playing audio files.
   isar: Embedded database for Flutter applications.
   isar_flutter_libs: Flutter integration for Isar database.
   build_runner: Dart package for generating code.
   build: Dart package for building and manipulating Dart packages programmatically.
   path_provider: Flutter plugin for accessing filesystem paths.
  