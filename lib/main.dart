// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:hangman/home_screen.dart';
import 'package:hangman/const/game/categories_screen.dart';
import 'package:hangman/game_screen.dart';
import 'package:hangman/const/game/best_score.dart';

// The main function that starts the application
void main() {
  runApp(const MyApp()); // Running the MyApp widget
}

// MyApp widget, which is the root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData.dark(), // Set the theme to dark mode
      home: const HomeScreen(), // Set the HomeScreen as the initial screen
      routes: {
        'homeScreen': (context) =>
            const HomeScreen(), // Define route for HomeScreen
        'gameScreen': (context) => GameScreen(), // Define route for GameScreen
        'categoriesScreen': (context) =>
            CategoriesScreen(), // Define route for CategoriesScreen
        'bestScoreScreen': (context) =>
            BestScoreScreen(), // Define route for BestScoreScreen
      },
    );
  }
}
