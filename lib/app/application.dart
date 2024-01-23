import 'package:flutter/material.dart';
import 'package:game_2048/presentation/presentation.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //TODO: Add routing and main menu
      home: const GameScreen(),
    );
  }
}
