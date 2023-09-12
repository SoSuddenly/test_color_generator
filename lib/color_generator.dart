import 'dart:math';

import 'package:flutter/material.dart';

/// generate random color for internal usage
/// no parameters
/// @returns - Color
Color _generateRandomColor() {
  final random = Random();
  final randomColor = Color.fromARGB(
    255, //0 being transparent and 255 being fully
    random.nextInt(256), //R >= to < so 255+1
    random.nextInt(256), //G
    random.nextInt(256), //B
  );

  return randomColor;
}

///for external access
Color getRandomBackgroundColor() {
  return _generateRandomColor();
}
