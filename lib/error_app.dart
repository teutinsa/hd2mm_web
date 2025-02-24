import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  final String title;
  final String message;

  const ErrorApp({required this.title, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.red,
                ),
              ),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
