import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> _colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.lime,
    Colors.cyan,
    Colors.deepOrange,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int i) {
      int index = i % _colors.length;
      return _colors[index];
    });
  }
}
