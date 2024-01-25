import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_2048/entity/entity.dart';

part 'board.freezed.dart';

@freezed
class Board with _$Board {
  const factory Board({
    @Default(false) bool won,
    @Default(false) bool over,
    @Default(0) int score,
    @Default(0) int best,
    required List<List<Tile>> tileArray,
    required GameSettings gameSettings,
    Board? previousBoard,
  }) = _Board;

  factory Board.newGame({
    required int best,
    required List<List<Tile>> tileArray,
    required GameSettings gameSettings,
  }) =>
      _Board(
        tileArray: tileArray,
        best: best,
        gameSettings: gameSettings,
      );

  factory Board.empty() => _Board(
        tileArray: [],
        gameSettings: GameSettings.defaultSizeGame(),
      );
}
