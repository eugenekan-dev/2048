import 'package:flutter/material.dart';
import 'package:game_2048/presentation/presentation.dart';
import 'package:game_2048/resources/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          GameBar(),
        ],
      ),
    );
  }
}
