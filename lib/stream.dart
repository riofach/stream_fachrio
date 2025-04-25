import 'package:flutter/material.dart';
import 'dart:async';

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

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  close() {
    controller.close();
  }
}
