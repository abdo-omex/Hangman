// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously

import 'dart:math'; // Importing the dart:math library for generating random numbers

import 'package:flutter/material.dart'; // Importing the Flutter material package
import 'package:hangman/const/consts.dart'; // Importing constants
import 'package:hangman/const/game/figure_widget.dart'; // Importing figure widget
import 'package:hangman/const/game/hidden_letters.dart'; // Importing hidden letters widget
import 'package:shared_preferences/shared_preferences.dart'; // Importing SharedPreferences

// Class representing the game screen widget
class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() =>
      _GameScreenState(); // Creating the stateful widget
}

// State class for the game screen
class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz"
      .toUpperCase(); // Characters to display for user input
  var word = "HangMan".toUpperCase(); // Word to be guessed
  List<String> selectedChar =
      []; // List to store selected characters by the user
  var tries = 0; // Variable to track number of tries
  var points = 0; // Variable to track points
  String category = ''; // Variable to store the category of the word

  // Map to store words categorized by their types
  Map<String, List<String>> wordCategories = {
    "Animal": [
      "lino",
      "bee",
      "bat",
      "bear",
      "bug",
      "goose",
      "mouse",
      "owl",
      "octopus",
      "duck",
      "eagle",
      "dolphin",
      "canary",
      "cat",
      "dog",
      "camel",
      "moose",
      "monkey",
      "koala",
      "horse",
      "goose",
      "fox",
      "goat",
      "frog",
      "fly",
      "fish",
      "eagle"
    ],
    "Food": [
      "eggs",
      "donuts",
      "falafel",
      "fish",
      "ginger",
      "grits",
      "kabobs",
      "ketchup",
      "kiwi",
      "Moose",
      "Noodles",
      "Ostrich",
      "Pizza",
      "Quiche",
      "Reuben",
      "Toast",
      "Waffles",
      "Yogurt",
      "Ziti"
    ],
    "Electronic Devices": [
      "Clock",
      "Headset",
      "iPod",
      "Mixer",
      "Monitor",
      "Mouse",
      "Oven",
      "Printer"
    ],
    "Jobs": [
      "nurse",
      "Actor",
      "Actuary",
      "Artist",
      "Driver",
      "doctor",
      "cashier",
      "pilot"
    ],
    "Body": [
      "eyes",
      "teeth",
      "toes",
      "head",
      "eyebrow",
      "ears",
      "hair",
      "tongue",
      "bones",
      "hand",
      "finger",
      "knee",
      "ankle",
      "nose",
      "leg",
      "thumb",
      "neck",
      "heel",
      "mouth",
      "beard"
    ],
    "Computer": [
      "mouse",
      "battery",
      "socket",
      "monitor",
      "printer",
      "line",
      "switch",
      "laptop",
      "disc",
      "tablet",
      "phone",
      "plug"
    ],
    "Subjects": [
      "maths",
      "music",
      "Spanish",
      "English",
      "Chinese",
      "art",
      "history",
      "physics",
      "biology"
    ],
    "Countries": [
      "America",
      "Canada",
      "Ireland",
      "France",
      "England",
      "Spain",
      "Egypt",
      "China",
      "India",
      "Italy",
      "Turkey",
      "Russia",
      "Germany",
      "Japan"
    ],
  };

  @override
  void initState() {
    super.initState();
    chooseRandomWord(); // Initializing the game by choosing a random word
  }

  // Method to choose a random word from a random category
  void chooseRandomWord() {
    var random = Random();
    category = wordCategories.keys.toList()[
        random.nextInt(wordCategories.length)]; // Selecting a random category
    word = wordCategories[category]![
            random.nextInt(wordCategories[category]!.length)]
        .toUpperCase(); // Selecting a random word from the chosen category
    selectedChar.clear(); // Clearing the selected characters list
  }

  // Method to save the score in shared preferences
  Future<void> saveScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scores = prefs.getStringList('scores') ?? [];
    scores.add(score.toString());
    await prefs.setStringList('scores', scores);
  }

  // Method to handle game over scenario
  void gameOver() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set AlertDialog background to white
          title: const Text(
            'GAME OVER',
            style: TextStyle(
              fontSize: 24, // Make title text larger
              color: Colors.black, // Change title color to black
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You scored $points points!',
                style: const TextStyle(
                  fontSize: 20, // Make score message text larger
                  color: Colors.black, // Change score message color to black
                ),
              ),
              const SizedBox(
                  height: 20), // Add space between the text and button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 24), // Make button larger
                  backgroundColor:
                      Color.fromARGB(255, 0, 0, 0), // Button background color
                  foregroundColor:
                      Color.fromARGB(255, 255, 255, 255), // Button text color
                ),
                onPressed: () async {
                  await saveScore(points); // Save the score
                  Navigator.of(context).pop(); // Close the dialog
                  chooseRandomWord(); // Restart the game
                  setState(() {
                    tries = 0; // Reset tries to 0 for the new game
                    points = 0; // Reset points
                  });
                },
                child: const Text(
                  'Retry',
                  style: TextStyle(fontSize: 18), // Make button text larger
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hangman",
          style: TextStyle(color: Colors.black), // Setting title color to black
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(186, 255, 255, 255),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.black, // Setting icon color to black
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('homeScreen');
            },
          ),
        ],
      ),
      backgroundColor:
          Color.fromARGB(90, 0, 0, 0), // Setting the background color to white
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      figure(
                          GameUI.hang, tries >= 0), // Displaying hangman figure
                      figure(GameUI.head, tries >= 1), // Displaying head
                      figure(GameUI.body, tries >= 2), // Displaying body
                      figure(
                          GameUI.rightArm, tries >= 3), // Displaying right arm
                      figure(GameUI.leftArm, tries >= 4), // Displaying left arm
                      figure(
                          GameUI.rightLeg, tries >= 5), // Displaying right leg
                      figure(GameUI.leftLeg, tries >= 6), // Displaying left leg
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: word
                          .split("")
                          .map(
                            (e) => hiddenLetter(
                              e,
                              !selectedChar.contains(e.toUpperCase()),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Displaying category
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Category: $category',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Change text color to black
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Displaying points
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Points: $points',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Change text color to black
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 7,
                children: characters.split("").map((e) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          Colors.white, // Change text color to black
                    ),
                    onPressed: selectedChar.contains(e.toUpperCase())
                        ? null // Disable button if character already selected
                        : () {
                            setState(() {
                              selectedChar.add(e.toUpperCase());
                              if (word.split("").contains(e.toUpperCase())) {
                                points +=
                                    5; // Award 5 points for correct guessing
                                if (word.split("").every((char) => selectedChar
                                    .contains(char.toUpperCase()))) {
                                  // If all characters are guessed correctly, choose a new random word
                                  chooseRandomWord();
                                  tries =
                                      0; // Reset tries to 0 for the new word
                                }
                              } else {
                                tries++;
                                points -=
                                    5; // Deduct 5 points for incorrect guessing
                                if (tries >= 6) {
                                  // If all tries are used up, show "GAME OVER" and a retry button
                                  gameOver();
                                }
                              }
                            });
                          },
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
