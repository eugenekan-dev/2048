import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_2048/entity/entity.dart';
import 'package:uuid/uuid.dart';

part 'tile.freezed.dart';

@freezed
abstract class Tile with _$Tile {
  const Tile._();
  const factory Tile({
    @Default(false) bool merged,
    required ArrayPosition position,
    required String id,
    required int value,
    ArrayPosition? nextPosition,
    // required int index,
    int? nextIndex,
  }) = _Tile;

  //TODO: update function with deiscriptive information
  Offset getPositon({
    required double size,
    required int quantity,
    required double padding,
    required int index,
  }) {
    /// Get vertical index of tile on the board;
    // final x = ((index + 1) / gameRowSize).ceil();
    // final y = x - 1;

    // /// Get horizontal index of tile on the board;
    // final z = index - (y * gameRowSize);
    final y = position.x + 1;
    final x = position.y;
    // print('[index] vertical $y');

    // print('[index] horizontal $z');

    // final left = z * size + ((z + 1) * padding);

    // final top = y * (size) + x * padding;

    // final y = ((index) / quantity).ceil();

    // final x = index - (((index + 1) / quantity).ceil() * quantity - quantity);
    print('[POS]  x:$x y:$y  x:${position.y} y:${position.x + 1} ');

    final left = ((y - 1) * size) + (padding * y);

    final top = (x * size) + (padding * (x + 1));

    // print('[POS]  x:$x y:$y  y:$top x:$left');

    return Offset(top, left);
  }

  factory Tile.empty(ArrayPosition position) {
    return Tile(
      position: position,
      id: const Uuid().v4(),
      value: 0,
      // index: offset,
    );
  }

  //TODO: udpate function, remove duplicated calculations;
  // double getTop({
  //   required double size,
  //   required int quantity,
  //   required double padding,
  // }) {
  //   /// Get vertical index of tile on the board;
  //   // final x = ((index + 1) / quantity).ceil();
  //   // final y = x - 1;

  //   // return y * (size) + (x * padding);
  // }

  //TODO: udpate function, remove duplicated calculations;
  // double getLeft({
  //   required double size,
  //   required int quantity,
  //   required double padding,
  // }) {
  //   // final x = ((index + 1) / quantity).ceil();
  //   // final y = x * quantity - quantity;

  //   // final z = index - (y * size);

  //   // return z * size + ((z + 1) * padding);

  //   final i = index - (((index + 1) / quantity).ceil() * quantity - quantity);

  //   return (i * size) + (padding * (i + 1));
  // }

  int get x => position.x;
  int get y => position.y;
  bool get isEmpty => value == 0;
}
