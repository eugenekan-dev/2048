import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/entity/entity.dart';
import 'package:uuid/uuid.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends IBloc<GameEvent, GameState> {
  GameBloc()
      : super(GameState(
          board: Board.empty(),
        ));

  @override
  EventTransformer<GameEvent>? get eventTransformer =>
      bloc_concurrency.droppable();

  // @override
  // void whenBlocInitialized() => add(const GameEvent.startNewGame());

  @override
  Future<void> mapEvent(GameEvent event, Emitter<GameState> emit) {
    return event.map<Future<void>>(
      startNewGame: (event) async {
        final list = List<Tile>.empty(growable: true);

        do {
          list.add(
            addNewTile(
              list.map((e) => e.index).toList(),
              event.settings.tileQuantity,
            ),
          );
        } while (list.length < event.settings.startingNumbersQuantity);

        emit(
          state.copyWith(
            gameStatus: GameStatus.initialized,
            board: Board.newGame(
              best: 0,
              tiles: list,
              gameSettings: event.settings,
            ),
          ),
        );
      },
      move: (event) async {
        print('${event.runtimeType} ${event.direction}');
        final tileList = List.from(state.board.tiles);

        tileList.sort((a, b) => a.index.compareTo(b.index));

        final newTiles = List<Tile>.empty(growable: true);

        for (int i = 0; i < tileList.length; i++) {
          final tile = _calculate(
            tile: tileList[i],
            list: newTiles,
            rowSize: state.board.gameSettings.fieldSize,
            direction: event.direction,
          );

          newTiles.add(tile);

          if (i + 1 < 1) {
            Tile next = tileList[i + 1];

            if (tile.value == next.value) {
              final index = tile.index, nextIndex = next.index;

              if (_inRange(
                  rowSize: state.board.gameSettings.fieldSize,
                  index: index,
                  nextIndex: nextIndex)) {
                newTiles.add(next.copyWith(nextIndex: tile.nextIndex));

                i += 1;
                continue;
              }
            }
          }
        }

        _printList(newTiles, 4);

        emit(
          state.copyWith(
            board: state.board.copyWith(
              tiles: List.from(newTiles),
              previousBoard: state.board,
            ),
          ),
        );
      },
    );
  }

  Tile addNewTile(List<int> indexList, int maxSize) {
    //TODO: update function
    var i = 0;

    do {
      i = Random().nextInt(maxSize);
    } while (indexList.contains(i));
    return Tile(
      id: const Uuid().v4(),
      value: 2,
      index: i,
    );
  }

  Tile _calculate({
    required Tile tile,
    required List<Tile> list,
    required int rowSize,
    required SwipeDirection direction,
  }) {
    int nextIndex = ((tile.index + 1) / rowSize).ceil() * rowSize - rowSize;

    if (list.isNotEmpty) {
      final lastIndex = list.last.nextIndex ?? list.last.index;

      if (_inRange(rowSize: rowSize, index: tile.index, nextIndex: lastIndex)) {
        nextIndex = lastIndex + 1;
      }
    }
    return tile.copyWith(nextIndex: nextIndex);
  }

  void _printList(List<Tile> list, int rowSize) {
    final board = List<int>.empty(growable: true);

    for (int i = 0; i < pow(rowSize, 2); i++) {
      board.add(0);
    }

    for (final tile in list) {
      board[tile.index] = tile.value;
    }

    String str = '';

    int newLine = 0;

    board.forEach((value) {
      if (newLine == rowSize) {
        newLine = 0;

        str += '\n';
      }

      str += '[${value}]';
      newLine++;
    });

    print(str);
  }

  /// Checks in index and next index in range of single row, divides [index] and
  ///  [nextIndex] by [rowSize], ceil both value, and compares result;
  bool _inRange({
    required int rowSize,
    required int index,
    required int nextIndex,
  }) =>
      (index / rowSize).ceil() == (nextIndex / rowSize).ceil();
}
