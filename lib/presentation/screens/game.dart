import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/domain/domain.dart';
import 'package:game_2048/entity/entity.dart';
import 'package:game_2048/presentation/presentation.dart';
import 'package:game_2048/resources/resources.dart';

class GameBlocProvider extends StatelessWidget {
  const GameBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (_) => GameBloc()
        ..add(
          GameEvent.startNewGame(
            GameSettings(fieldSize: 4),
          ),
        ),
      child: const GameScreen(),
    );
  }
}

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
      body: BlocBuilder<GameBloc, GameState>(
        builder: (_, state) {
          if (state.gameStatus.isInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Column(
            children: [
              GameBar(),
              GameBoard(),
            ],
          );
        },
      ),
    );
  }
}
