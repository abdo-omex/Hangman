// ignore_for_file: unused_import, file_names, unused_element, prefer_const_constructors

// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hangman/const/game/categories_screen.dart';
import 'package:hangman/const/game/Best_score.dart';

// HomeScreen widget, which is a stateful widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// State class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  int bestScore = 0; // Variable to store the best score

  @override
  void initState() {
    super.initState();
    _loadBestScore(); // Load the best score when the widget is initialized
  }

  // Method to load the best score from SharedPreferences
  Future<void> _loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bestScore = prefs.getInt('bestScore') ??
          0; // Load best score or set to 0 if not found
    });
  }

  // Method to update the best score in SharedPreferences
  Future<void> _updateBestScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bestScore = score; // Update best score in state
      prefs.setInt(
          'bestScore', bestScore); // Save best score to SharedPreferences
    });
  }

  // Method to navigate to the game screen
  void openGameScreen() {
    Navigator.of(context).pushReplacementNamed('gameScreen');
  }

  // Method to navigate to the best score screen
  void openBestScoreScreen() {
    Navigator.of(context).pushNamed('bestScoreScreen');
  }

  // Method to navigate to the categories screen
  void openCategoriesScreen() {
    Navigator.of(context).pushNamed('categoriesScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), // Set background color to white
      appBar: AppBar(
        title: const Text('Hangman Home'), // Set AppBar title
        backgroundColor: Color.fromARGB(
            255, 0, 0, 0), // Set AppBar background color to black
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('Images/Hangman.png'), // Display Hangman image
                const SizedBox(height: 15), // Add vertical spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: openGameScreen, // Open game screen on tap
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Set container color to black
                        borderRadius:
                            BorderRadius.circular(12), // Set border radius
                      ),
                      child: const Center(
                        child: Text(
                          'Start', // Start button text
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 255, 255, 255), // Set text color to white
                            fontSize: 18, // Set text size
                            fontWeight: FontWeight.bold, // Set text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15), // Add vertical spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: openBestScoreScreen, // Open best score screen on tap
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Set container color to black
                        borderRadius:
                            BorderRadius.circular(12), // Set border radius
                      ),
                      child: const Center(
                        child: Text(
                          'Best Score', // Best Score button text
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 255, 255, 255), // Set text color to white
                            fontSize: 18, // Set text size
                            fontWeight: FontWeight.bold, // Set text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15), // Add vertical spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap:
                        openCategoriesScreen, // Open categories screen on tap
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Set container color to black
                        borderRadius:
                            BorderRadius.circular(12), // Set border radius
                      ),
                      child: const Center(
                        child: Text(
                          'Categories', // Categories button text
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 255, 255, 255), // Set text color to white
                            fontSize: 18, // Set text size
                            fontWeight: FontWeight.bold, // Set text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
