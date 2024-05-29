# Duplic-Eraser - Odun1
This app is designed to help users remove duplicate characters from strings


#                                                   Prerequisites
1. Flutter Installation: Ensure that Flutter SDK is installed on your system. You can follow the instructions on the official Flutter website to install Flutter.
2. Git: Install Git on your system if you haven't already. You can download Git from the official Git website.
   
 #                                                Steps to Run the Code
Clone the Repository: Clone the GitHub repository containing the code to your local machine.

Navigate to the Project Directory: Use the cd command to navigate into the project directory:

Get Dependencies: Run "flutter pub get" command to get all the dependencies required for the project

Run the Application: Once the dependencies are installed, run the application using "flutter run" command:



Ensure that your Flutter environment is properly configured, and you have the necessary emulators or devices set up for testing.
If you encounter any issues during the setup or execution of the code, check the Flutter documentation or seek assistance from the Flutter community.


#                                                    Tests in Duplic Eraser

This Flutter app, Duplic Eraser, includes tests to ensure the correctness and functionality of various components. These tests are written using the Flutter testing framework and cover different aspects of the app's behavior.

#                                                     Testing Approach
1. Reusable Text Widget Test
   Test Description: This test verifies the behavior of the reusable text widget used throughout the app.
   Type: Widget Test
   Functionality Tested:
      Rendering of text with specified style attributes such as font size and color.
2. Bloc Functionality Test
   Test Description: This test ensures the functionality of the Bloc pattern implemented in the app.
   Type: Widget Test
   Functionality Tested:
      Interaction with input fields and buttons.
      State management and data flow between input fields, Blocs, and widgets.
      Handling of user inputs and submission.
#                                                      How to Run Tests
To run the tests locally, follow these steps:
Navigate to the project directory in your terminal.
Run the "flutter test" command to execute the tests



#                                                                   DUPLIC_ERASER



This documentation provides an overview of the Duplic Eraser application, its features, components, and
dependencies. It serves as a guide for understanding the structure and functionality of the application.

#                                                             Overview of Duplic Eraser

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




#                                                            ASSUMPTIONS MADE

In accordance with the provided examples in the task, it is assumed that users should only enter lowercase letters. Therefore, if a user enters an uppercase letter, it will be automatically converted to lowercase.
