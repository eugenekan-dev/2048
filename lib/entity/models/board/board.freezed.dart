// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Board {
  bool get won => throw _privateConstructorUsedError;
  bool get over => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get best => throw _privateConstructorUsedError;
  List<List<Tile>> get tiles => throw _privateConstructorUsedError;
  GameSettings get gameSettings => throw _privateConstructorUsedError;
  Board? get previousBoard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res, Board>;
  @useResult
  $Res call(
      {bool won,
      bool over,
      int score,
      int best,
      List<List<Tile>> tiles,
      GameSettings gameSettings,
      Board? previousBoard});

  $BoardCopyWith<$Res>? get previousBoard;
}

/// @nodoc
class _$BoardCopyWithImpl<$Res, $Val extends Board>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? won = null,
    Object? over = null,
    Object? score = null,
    Object? best = null,
    Object? tiles = null,
    Object? gameSettings = null,
    Object? previousBoard = freezed,
  }) {
    return _then(_value.copyWith(
      won: null == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as bool,
      over: null == over
          ? _value.over
          : over // ignore: cast_nullable_to_non_nullable
              as bool,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as int,
      tiles: null == tiles
          ? _value.tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as List<List<Tile>>,
      gameSettings: null == gameSettings
          ? _value.gameSettings
          : gameSettings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      previousBoard: freezed == previousBoard
          ? _value.previousBoard
          : previousBoard // ignore: cast_nullable_to_non_nullable
              as Board?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res>? get previousBoard {
    if (_value.previousBoard == null) {
      return null;
    }

    return $BoardCopyWith<$Res>(_value.previousBoard!, (value) {
      return _then(_value.copyWith(previousBoard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardImplCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$BoardImplCopyWith(
          _$BoardImpl value, $Res Function(_$BoardImpl) then) =
      __$$BoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool won,
      bool over,
      int score,
      int best,
      List<List<Tile>> tiles,
      GameSettings gameSettings,
      Board? previousBoard});

  @override
  $BoardCopyWith<$Res>? get previousBoard;
}

/// @nodoc
class __$$BoardImplCopyWithImpl<$Res>
    extends _$BoardCopyWithImpl<$Res, _$BoardImpl>
    implements _$$BoardImplCopyWith<$Res> {
  __$$BoardImplCopyWithImpl(
      _$BoardImpl _value, $Res Function(_$BoardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? won = null,
    Object? over = null,
    Object? score = null,
    Object? best = null,
    Object? tiles = null,
    Object? gameSettings = null,
    Object? previousBoard = freezed,
  }) {
    return _then(_$BoardImpl(
      won: null == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as bool,
      over: null == over
          ? _value.over
          : over // ignore: cast_nullable_to_non_nullable
              as bool,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as int,
      tiles: null == tiles
          ? _value._tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as List<List<Tile>>,
      gameSettings: null == gameSettings
          ? _value.gameSettings
          : gameSettings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      previousBoard: freezed == previousBoard
          ? _value.previousBoard
          : previousBoard // ignore: cast_nullable_to_non_nullable
              as Board?,
    ));
  }
}

/// @nodoc

class _$BoardImpl implements _Board {
  const _$BoardImpl(
      {this.won = false,
      this.over = false,
      this.score = 0,
      this.best = 0,
      required final List<List<Tile>> tiles,
      required this.gameSettings,
      this.previousBoard})
      : _tiles = tiles;

  @override
  @JsonKey()
  final bool won;
  @override
  @JsonKey()
  final bool over;
  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final int best;
  final List<List<Tile>> _tiles;
  @override
  List<List<Tile>> get tiles {
    if (_tiles is EqualUnmodifiableListView) return _tiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiles);
  }

  @override
  final GameSettings gameSettings;
  @override
  final Board? previousBoard;

  @override
  String toString() {
    return 'Board(won: $won, over: $over, score: $score, best: $best, tiles: $tiles, gameSettings: $gameSettings, previousBoard: $previousBoard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardImpl &&
            (identical(other.won, won) || other.won == won) &&
            (identical(other.over, over) || other.over == over) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.best, best) || other.best == best) &&
            const DeepCollectionEquality().equals(other._tiles, _tiles) &&
            (identical(other.gameSettings, gameSettings) ||
                other.gameSettings == gameSettings) &&
            (identical(other.previousBoard, previousBoard) ||
                other.previousBoard == previousBoard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, won, over, score, best,
      const DeepCollectionEquality().hash(_tiles), gameSettings, previousBoard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      __$$BoardImplCopyWithImpl<_$BoardImpl>(this, _$identity);
}

abstract class _Board implements Board {
  const factory _Board(
      {final bool won,
      final bool over,
      final int score,
      final int best,
      required final List<List<Tile>> tiles,
      required final GameSettings gameSettings,
      final Board? previousBoard}) = _$BoardImpl;

  @override
  bool get won;
  @override
  bool get over;
  @override
  int get score;
  @override
  int get best;
  @override
  List<List<Tile>> get tiles;
  @override
  GameSettings get gameSettings;
  @override
  Board? get previousBoard;
  @override
  @JsonKey(ignore: true)
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
