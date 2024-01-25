import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:game_2048/domain/game/game_bloc.dart';
import 'package:game_2048/presentation/presentation.dart';
import 'package:game_2048/resources/resources.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    super.key,
  });

  final double innerPadding = 8.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (_, state) {
      if (state.gameStatus.isInitial) {
        return const SizedBox();
      }

      final size = max(
        300.0,
        min(
          (MediaQuery.of(context).size.shortestSide * 0.9).floorToDouble(),
          500.0,
        ),
      );

      final gameSettings = state.board.gameSettings;

      final tileNumber = gameSettings.fieldSize;

      /// Calculate cell sizes, that containt tile and inner padding;
      final cellSize = size / tileNumber;

      /// Calculate single tile size based on padding;
      final tileSize = cellSize - innerPadding - (innerPadding / tileNumber);

      /// Calculate board size based on cell sizes;
      final boardWidth = cellSize * tileNumber;

      return SwipeDetector(
        onSwipe: (direction, offset) =>
            context.read<GameBloc>().add(GameEvent.move(direction)),
        child: Container(
          margin: const EdgeInsets.only(
            top: 24,
          ),
          width: boardWidth,
          height: boardWidth,
          child: Stack(
            children: [
              BoardBackground(
                boardSize: boardWidth,
              ),
              TileLayer(
                gameRowSize: tileNumber,
                gameSize: gameSettings.tileQuantity,
                boardWidth: boardWidth,
                tileSize: tileSize,
                innerPadding: innerPadding,
                builder: (index, size, top, left) {
                  return Positioned(
                    top: top,
                    left: left,
                    child: Container(
                      width: tileSize,
                      height: tileSize,
                      decoration: const BoxDecoration(
                        color: AppColors.emptyTileColor,
                        borderRadius: AppColors.borderRadius,
                      ),
                    ),
                  );
                },
              ),
              TileLayer(
                gameSize: state.board.tiles.length,
                boardWidth: boardWidth,
                tileSize: tileSize,
                gameRowSize: tileNumber,
                innerPadding: innerPadding,
                builder: (index, size, top, left) {
                  print('rebuild');
                  final tile = state.board.tiles[index];

                  final position = tile.getPositon(
                    size: size,
                    quantity: tileNumber,
                    padding: innerPadding,
                  );
                  return Positioned(
                    key: ValueKey(tile.id),
                    top: position.dx,
                    left: position.dy,
                    child: Container(
                      width: tileSize,
                      height: tileSize,
                      decoration: BoxDecoration(
                        color: AppColors.tileColors[tile.value],
                        borderRadius: AppColors.borderRadius,
                      ),
                      child: Center(
                        child: Text('${tile.value}'),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TileLayer extends StatelessWidget {
  const TileLayer({
    super.key,
    required this.builder,
    required this.innerPadding,
    required this.tileSize,
    required this.boardWidth,
    required this.gameSize,
    required this.gameRowSize,
  });

  final int gameSize;
  final int gameRowSize;

  final double innerPadding;
  final double tileSize;
  final double boardWidth;

  final Widget Function(
    int index,
    double size,
    double top,
    double left,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boardWidth,
      height: boardWidth,
      child: Stack(
        children: [
          ...List.generate(
            gameSize,
            (index) {
              /// Get vertical index of tile on the board;
              final x = ((index + 1) / gameRowSize).ceil();
              final y = x - 1;

              /// Get horizontal index of tile on the board;
              final z = index - (y * gameRowSize);

              /// Get location based on horizontal and vertical index`s;
              final left = z * tileSize + ((z + 1) * innerPadding);
              final top = y * (tileSize) + x * innerPadding;
              return builder(index, tileSize, top, left);
            },
          ),
        ],
      ),
    );
  }
}
