part of 'game_bloc.dart';

enum GameStatus {
  initial,
  initialized,
  ended,
}

extension GameStatusExtension on GameStatus {
  bool get isInitial => this == GameStatus.initial;
  bool get isInitialized => this == GameStatus.initialized;
  bool get isEnded => this == GameStatus.ended;
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStatus.initial) GameStatus gameStatus,
    required Board board,
  }) = _GameState;
}
