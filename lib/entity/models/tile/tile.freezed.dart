// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Tile {
  bool get merged => throw _privateConstructorUsedError;
  ArrayPosition get position => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  ArrayPosition? get nextPosition =>
      throw _privateConstructorUsedError; // required int index,
  int? get nextIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TileCopyWith<Tile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TileCopyWith<$Res> {
  factory $TileCopyWith(Tile value, $Res Function(Tile) then) =
      _$TileCopyWithImpl<$Res, Tile>;
  @useResult
  $Res call(
      {bool merged,
      ArrayPosition position,
      String id,
      int value,
      ArrayPosition? nextPosition,
      int? nextIndex});
}

/// @nodoc
class _$TileCopyWithImpl<$Res, $Val extends Tile>
    implements $TileCopyWith<$Res> {
  _$TileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merged = null,
    Object? position = null,
    Object? id = null,
    Object? value = null,
    Object? nextPosition = freezed,
    Object? nextIndex = freezed,
  }) {
    return _then(_value.copyWith(
      merged: null == merged
          ? _value.merged
          : merged // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as ArrayPosition,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      nextPosition: freezed == nextPosition
          ? _value.nextPosition
          : nextPosition // ignore: cast_nullable_to_non_nullable
              as ArrayPosition?,
      nextIndex: freezed == nextIndex
          ? _value.nextIndex
          : nextIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TileImplCopyWith<$Res> implements $TileCopyWith<$Res> {
  factory _$$TileImplCopyWith(
          _$TileImpl value, $Res Function(_$TileImpl) then) =
      __$$TileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool merged,
      ArrayPosition position,
      String id,
      int value,
      ArrayPosition? nextPosition,
      int? nextIndex});
}

/// @nodoc
class __$$TileImplCopyWithImpl<$Res>
    extends _$TileCopyWithImpl<$Res, _$TileImpl>
    implements _$$TileImplCopyWith<$Res> {
  __$$TileImplCopyWithImpl(_$TileImpl _value, $Res Function(_$TileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merged = null,
    Object? position = null,
    Object? id = null,
    Object? value = null,
    Object? nextPosition = freezed,
    Object? nextIndex = freezed,
  }) {
    return _then(_$TileImpl(
      merged: null == merged
          ? _value.merged
          : merged // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as ArrayPosition,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      nextPosition: freezed == nextPosition
          ? _value.nextPosition
          : nextPosition // ignore: cast_nullable_to_non_nullable
              as ArrayPosition?,
      nextIndex: freezed == nextIndex
          ? _value.nextIndex
          : nextIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TileImpl extends _Tile with DiagnosticableTreeMixin {
  const _$TileImpl(
      {this.merged = false,
      required this.position,
      required this.id,
      required this.value,
      this.nextPosition,
      this.nextIndex})
      : super._();

  @override
  @JsonKey()
  final bool merged;
  @override
  final ArrayPosition position;
  @override
  final String id;
  @override
  final int value;
  @override
  final ArrayPosition? nextPosition;
// required int index,
  @override
  final int? nextIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Tile(merged: $merged, position: $position, id: $id, value: $value, nextPosition: $nextPosition, nextIndex: $nextIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Tile'))
      ..add(DiagnosticsProperty('merged', merged))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('nextPosition', nextPosition))
      ..add(DiagnosticsProperty('nextIndex', nextIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TileImpl &&
            (identical(other.merged, merged) || other.merged == merged) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.nextPosition, nextPosition) ||
                other.nextPosition == nextPosition) &&
            (identical(other.nextIndex, nextIndex) ||
                other.nextIndex == nextIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, merged, position, id, value, nextPosition, nextIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TileImplCopyWith<_$TileImpl> get copyWith =>
      __$$TileImplCopyWithImpl<_$TileImpl>(this, _$identity);
}

abstract class _Tile extends Tile {
  const factory _Tile(
      {final bool merged,
      required final ArrayPosition position,
      required final String id,
      required final int value,
      final ArrayPosition? nextPosition,
      final int? nextIndex}) = _$TileImpl;
  const _Tile._() : super._();

  @override
  bool get merged;
  @override
  ArrayPosition get position;
  @override
  String get id;
  @override
  int get value;
  @override
  ArrayPosition? get nextPosition;
  @override // required int index,
  int? get nextIndex;
  @override
  @JsonKey(ignore: true)
  _$$TileImplCopyWith<_$TileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
