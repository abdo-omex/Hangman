// Ignore warnings about missing key in widget constructors and file names
// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stateful widget to display the best scores
class BestScoreScreen extends StatefulWidget {
  @override
  State<BestScoreScreen> createState() => _BestScoreScreenState();
}

// State class for BestScoreScreen
class _BestScoreScreenState extends State<BestScoreScreen> {
  // List to hold scores
  List<int> scores = [];

  @override
  void initState() {
    super.initState();
    // Load scores when the state is initialized
    _loadScores();
  }

  // Function to load scores from SharedPreferences
  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve scores from SharedPreferences, defaulting to an empty list if not found
      scores = (prefs.getStringList('scores') ?? [])
          .map((e) => int.parse(e)) // Convert each score from String to int
          .toList();
      // Sort scores in descending order
      scores.sort((a, b) => b.compareTo(a));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a title and background color
      appBar: AppBar(
        title: const Text('Best Scores'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      // Background color for the scaffold
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      // Padding around the body content
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // ListView to display the scores
        child: ListView.builder(
          itemCount: scores.length, // Number of items in the list
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(
                  255, 0, 0, 0), // Background color of the card
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 16.0), // Margin around the card
              child: ListTile(
                leading:
                    Icon(Icons.star, color: Colors.yellow[700]), // Leading icon
                title: Text(
                  'Score: ${scores[index]}', // Display the score
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255), // Text color
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
