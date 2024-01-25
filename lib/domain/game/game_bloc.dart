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
        final newList = _move(state.board.tiles, event.direction);

        final mergeList = _merge(newList);

        print('newList ${mergeList.last}');

        GameBoardUtil.printList(newList, 4);
        emit(
          state.copyWith(
            board: state.board.copyWith(
              tiles: List.from(mergeList),
              previousBoard: state.board,
            ),
          ),
        );
      },
    );
  }

  List<Tile> _move(List<Tile> list, SwipeDirection direction) {
    print('DIRECTION $direction');
    final tileList = List<Tile>.from(list);
    final verticalOrder =
        GameBoardUtil.verticalOrder(state.board.gameSettings.fieldSize);

    final asc = direction.isLeft || direction.isUp;

    final isVertical = direction.isUp || direction.isDown;

    tileList.sort(
      (a, b) =>
          (asc ? 1 : -1) *
          (isVertical
              ? verticalOrder[a.index].compareTo(verticalOrder[b.index])
              : a.index.compareTo(b.index)),
    );

    final newTiles = List<Tile>.empty(growable: true);

    for (int i = 0; i < tileList.length; i++) {
      final tile = _calculate(
        tile: tileList[i],
        list: newTiles,
        rowSize: state.board.gameSettings.fieldSize,
        direction: direction,
      );

      newTiles.add(tile);

      if (i + 1 < 1) {
        Tile next = tileList[i + 1];

        if (tile.value == next.value) {
          final index = isVertical ? verticalOrder[tile.index] : tile.index;
          final nextIndex = isVertical ? verticalOrder[next.index] : next.index;

          final inRange = _inRange(
              rowSize: state.board.gameSettings.fieldSize,
              index: index,
              nextIndex: nextIndex);

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

    GameBoardUtil.printList(newTiles, 4);

    return newTiles;
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
    final asc = direction.isLeft || direction.isUp;
    final isVertical = direction.isDown || direction.isUp;

    final verticalOrder =
        GameBoardUtil.verticalOrder(state.board.gameSettings.fieldSize);

    int index = isVertical ? verticalOrder[tile.index] : tile.index;

    int nextIndex =
        ((index + 1) / rowSize).ceil() * rowSize - (asc ? rowSize : 1);

    if (list.isNotEmpty) {
      var last = list.last;
      var lastIndex = last.nextIndex ?? last.index;
      lastIndex = isVertical ? verticalOrder[lastIndex] : lastIndex;

      if (_inRange(rowSize: rowSize, index: tile.index, nextIndex: lastIndex)) {
        nextIndex = lastIndex + (asc ? 1 : -1);
      }
    }
    return tile.copyWith(
        nextIndex: isVertical ? verticalOrder.indexOf(nextIndex) : nextIndex);
  }

  List<Tile> _merge(
    List<Tile> list,
  ) {
    final tiles = List<Tile>.empty(growable: true);

    bool tilesMoved = false;
    final indexes = List<int>.empty(growable: true);

    int score = state.board.score;

    for (int i = 0; i < list.length; i++) {
      Tile tile = list[i];
      bool merged = false;
      int value = tile.value;

      if (i + 1 < 1) {
        Tile next = list[i + 1];
        if (tile.nextIndex == next.nextIndex ||
            tile.index == next.nextIndex && tile.nextIndex == null) {
          value = tile.value + next.value;

          // print('')
          merged = true;
          score += value;
          i += 1;
        }
      }

      if (merged || tile.nextIndex != null && tile.index != tile.nextIndex) {
        tilesMoved = true;
      }

      tiles.add(tile.copyWith(
        index: tile.nextIndex ?? tile.index,
        nextIndex: null,
        value: value,
        merged: merged,
      ));

      indexes.add(tiles.last.index);
    }

    // if (tilesMoved) {
    //   tiles.add(addNewTile(indexes, state.board.gameSettings.fieldSize));
    // }

    return tiles;
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

extension SwipeDirectionExtension on SwipeDirection {
  bool get isLeft => this == SwipeDirection.left;

  bool get isRight => this == SwipeDirection.right;
  bool get isUp => this == SwipeDirection.up;
  bool get isDown => this == SwipeDirection.down;
}

class GameBoardUtil {
  const GameBoardUtil._();

  static List<int> verticalOrder(int size) {
    final list = List.generate(pow(size, 2).toInt(), (index) => index);
    printListInt(list);

    final newList = List<int>.empty(growable: true);

    for (int i = 0; i < size; i++) {
      final num = size * size - (size - i);
      for (int j = 0; j < size; j++) {
        newList.add(num - size * j);
      }
    }

    return newList;
  }

  static void printListInt(List<int> list) {
    final size = sqrt(list.length);

    String str = '';

    for (int i = 0; i < list.length; i++) {
      final v = (i / size).toString();

      if (v.contains('.0')) {
        str += '\n${(i / size).ceil() + 1}: ';
      }

      str += '[${list[i]}]';
    }

    print(str);
  }

  static void printList(List<Tile> list, int rowSize) {
    final board = List<int>.empty(growable: true);
    final maxSize = pow(rowSize, 2);

    for (int i = 0; i < maxSize; i++) {
      board.add(0);
    }

    for (final tile in list) {
      board[tile.index] = tile.value;
    }

    String str = '';

    for (int i = 0; i < maxSize; i++) {
      final v = (i / 4).toString();

      if (v.contains('.0')) {
        str += '\n${(i / 4).ceil() + 1}: ';
      }

      str += '[${board[i]}]';
    }

    print(str);
  }

  static void printArray(List<List<Tile>> array) {
    String str = '';

    for (int i = 0; i < array.length; i++) {
      str += '\n${i + 1}: ';

      for (final tile in array[i]) {
        str += '[${tile.value}]';
      }
    }

    print('PRINT array $str');
  }
}
