part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  const factory GameState.initial() = GameInititalState;

  const factory GameState.initialized({required Board board}) =
      GameInitializedState;
}
