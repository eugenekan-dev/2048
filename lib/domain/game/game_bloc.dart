import 'dart:math';

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
              event.settings.tileQuantity,
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
}
