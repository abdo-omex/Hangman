import 'package:flutter/material.dart';
import 'package:hangman/home_screen.dart';
import 'package:hangman/const/game/categories_screen.dart';
import 'package:hangman/game_screen.dart';
import 'package:hangman/const/game/best_score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
      routes: {
        'homeScreen': (context) => const HomeScreen(),
        'gameScreen': (context) => GameScreen(),
        'categoriesScreen': (context) => CategoriesScreen(),
        'bestScoreScreen': (context) => BestScoreScreen(),
      },
    );
  }
}
