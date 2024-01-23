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

  //TODO: udpate function, remove duplicated calculations;
  double getTop({
    required double size,
    required int quantity,
    required double padding,
  }) {
    /// Get vertical index of tile on the board;
    final x = ((index + 1) / size).ceil();
    final y = x - 1;

    return y * (size) + x * padding;
  }

  //TODO: udpate function, remove duplicated calculations;
  double getLeft({
    required double size,
    required int quantity,
    required double padding,
  }) {
    final x = ((index + 1) / size).ceil();
    final y = x - 1;

    final z = index - (y * size);

    return z * size + ((z + 1) * padding);
  }
}
