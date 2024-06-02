import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final Map<String, List<String>> wordCategories = {
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
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: wordCategories.entries.map((entry) {
            return Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.black,
              ),
              child: ExpansionTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.black),
                ),
                children: entry.value.map((word) {
                  return ListTile(
                    title: Text(
                      word,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
