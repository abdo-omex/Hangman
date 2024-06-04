import "package:flutter/material.dart";

// Function to create a widget displaying an image with visibility control
Widget figure(String path, bool visible) {
  return SizedBox(
    // Set the width and height of the SizedBox
    width: 250,
    height: 250,
    // Visibility widget controls the visibility of its child
    child: Visibility(
      visible: visible, // Controls whether the image is visible or not
      // Image.asset widget loads an image from the specified path
      child: Image.asset(path),
    ),
  );
}
