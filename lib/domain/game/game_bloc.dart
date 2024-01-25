import 'dart:math';
import 'dart:ui';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/entity/entity.dart';
import 'package:uuid/uuid.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends IBloc<GameEvent, GameState> {
  GameBloc() : super(const GameState.initial());

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
              event.settings.fieldSize,
            ),
          );
        } while (list.length < event.settings.startingNumbersQuantity);

        print('list ${list.length}');

        emit(
          GameState.initialized(
            board: Board.newGame(
              best: 0,
              tiles: list,
              gameSettings: event.settings,
            ),
          ),
        );
      },
    );
  }

  Tile addNewTile(List<Offset> indexList, int rowSize) {
    //TODO: update function
    var i = 0;

    do {
      final random = Random();
      final x = random.nextInt(rowSize);
      final y = random.nextInt(rowSize);
    } while (indexList.contains(i));
    return Tile(
      id: const Uuid().v4(),
      value: 2,
      index: i,
    );
  }
}
