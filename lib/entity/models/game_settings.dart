import 'dart:math';

class GameSettings {
  GameSettings({
    required this.fieldSize,
    this.startingNumbersQuantity = 2,
  });

  final int fieldSize;
  final int startingNumbersQuantity;

  int get tileQuantity => pow(fieldSize, 2).toInt();
}
