import 'package:flutter/material.dart';
import 'package:game_2048/entity/entity.dart';
import 'package:game_2048/presentation/presentation.dart';
import 'package:game_2048/resources/resources.dart';

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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const GameBar(),
          GameBoard(
            gameSettings: GameSettings(
              fieldSize: 4,
            ),
          ),
        ],
      ),
    );
  }
}
