import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile.freezed.dart';

@freezed
abstract class Tile with _$Tile {
  const Tile._();
  const factory Tile({
    @Default(false) bool merged,
    required String id,
    required int value,
    required int index,
    int? nextIndex,
  }) = _Tile;

  //TODO: update function with deiscriptive information
  Offset getPositon({
    required double size,
    required int quantity,
    required double padding,
  }) {
    final i = ((index + 1) / quantity).ceil();

    final x = ((i - 1) * size) + (padding * i);

    final z = index - (((index + 1) / quantity).ceil() * quantity - quantity);

    final y = (z * size) + (padding * (z + 1));

    return Offset(x, y);
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

  bool get isEmpty => value == 0;
}
