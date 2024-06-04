// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

// Class to hold app-wide color constants
class AppColors {
  // Background color
  static final bgColor = Color.fromARGB(255, 0, 0, 0); // Black color
  // Text color
  static final textColor = Color.fromARGB(255, 255, 255, 255); // White color
}

// Class to hold file paths for game UI images
class GameUI {
  static const hang = "Images/hang.png"; // Path to hang image
  static const head = "Images/head.png"; // Path to head image
  static const body = "Images/body.png"; // Path to body image
  static const rightArm = "Images/r_arm.png"; // Path to right arm image
  static const leftArm = "Images/l_arm.png"; // Path to left arm image
  static const rightLeg = "Images/r_leg.png"; // Path to right leg image
  static const leftLeg = "Images/l_leg.png"; // Path to left leg image
}
