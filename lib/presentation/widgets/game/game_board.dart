part of 'game.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    super.key,
    required this.gameSettings,
  });
  final GameSettings gameSettings;

  final double innerPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final size = max(
      300.0,
      min(
        (MediaQuery.of(context).size.shortestSide * 0.9).floorToDouble(),
        500.0,
      ),
    );

    final tileNumber = gameSettings.fieldSize;

    /// Calculate the number of cell on the board;
    final numberOfCells = pow(tileNumber, 2).toInt();

    /// Calculate cell sizes, that containt tile and inner padding;
    final cellSize = size / tileNumber;

    /// Calculate single tile size based on padding;
    final tileSize = cellSize - innerPadding - (innerPadding / tileNumber);

    /// Calculate board size based on cell sizes;
    final boardSize = cellSize * tileNumber;
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      width: boardSize,
      height: boardSize,
      decoration: const BoxDecoration(
        color: AppColors.boardColor,
        borderRadius: AppColors.borderRadius,
      ),
      child: Stack(
        children: [
          ...List.generate(
            numberOfCells,
            (index) {
              /// Get vertical index of tile on the board;
              final x = ((index + 1) / tileNumber).ceil();
              final y = x - 1;

              /// Get horizontal index of tile on the board;
              final z = index - (y * tileNumber);

              /// Get location based on horizontal and vertical index`s;
              final left = z * tileSize + ((z + 1) * innerPadding);
              final top = y * (tileSize) + x * innerPadding;

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
        ],
      ),
    );
  }
}
