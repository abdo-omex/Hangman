import "package:flutter/material.dart";
import "package:hangman/const/consts.dart"; // Importing constants

// Function to create a widget displaying a hidden letter with visibility control
Widget hiddenLetter(String char, bool visible) {
  return Container(
    // Align the content of the container to the center
    alignment: Alignment.center,
    // Set the width and height of the container
    width: 50,
    height: 50,
    // Decorate the container with a border radius and background color
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      // ignore: prefer_const_constructors
      color: Color.fromARGB(255, 255, 255, 255), // White background color
    ),
    // Visibility widget controls the visibility of its child
    child: Visibility(
      visible: !visible, // Invert the visibility flag to hide the letter
      // Text widget to display the character
      child: Text(
        char, // Character to be displayed
        style: TextStyle(
          fontWeight: FontWeight.bold, // Bold text
          fontSize: 22, // Font size of the text
          color: AppColors.bgColor, // Text color from constants
        ),
      ),
    ),
  );
}
