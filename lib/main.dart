import 'package:flutter/material.dart';
import 'package:hangman/game_screen.dart'; // Importing the GameScreen widget

void main() {
  runApp(const MyApp()); // Running the app by calling the MyApp widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for the MyApp class

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Creating a MaterialApp widget
      debugShowCheckedModeBanner:
          false, // Disabling the debug banner in debug mode
      theme: ThemeData.dark(), // Setting the theme to dark mode
      home: GameScreen(), // Setting the home screen to the GameScreen widget
    );
  }
}
