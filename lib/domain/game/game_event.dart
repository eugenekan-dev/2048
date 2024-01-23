part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const GameEvent._();

  const factory GameEvent.startNewGame(GameSettings settings) = _StartNewGame;
}
