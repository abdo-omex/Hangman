import "package:flutter/material.dart";
import "package:hangman/const/consts.dart";

Widget hiddenLetter(String char, bool visible) {
  return Container(
    alignment: Alignment.center,
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 255, 255, 255)),
    child: Visibility(
        visible: !visible,
        child: Text(char,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.bgColor,
            ))),
  );
}
