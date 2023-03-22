import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        "Hello, Flutter!",
        style: TextStyle(
            color: Colors.red, fontSize: 35, fontWeight: FontWeight.bold),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
