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
    required List<List<Tile>> tiles,
    required GameSettings gameSettings,
    Board? previousBoard,
  }) = _Board;

  factory Board.newGame({
    required int best,
    required List<List<Tile>> tiles,
    required GameSettings gameSettings,
  }) =>
      _Board(
        tiles: tiles,
        best: best,
        gameSettings: gameSettings,
      );

  List<Tile> get getBoardTilesAsList {
    final newList = List<Tile>.empty(growable: true);

    for (List<Tile> list in tiles) {
      newList.addAll(list);
    }
    return newList;
  }

  List<List<Tile?>> getEmptyBoard(int rowSize) {
    final board =
        List<List<Tile?>>.filled(rowSize, List<Tile?>.filled(rowSize, null));

    return board;
  }
}
