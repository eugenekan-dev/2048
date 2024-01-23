import 'package:flutter/material.dart';
import 'package:game_2048/resources/resources.dart';

class BoardBackground extends StatelessWidget {
  const BoardBackground({
    super.key,
    required this.boardSize,
  });
  final double boardSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boardSize,
      height: boardSize,
      decoration: const BoxDecoration(
        color: AppColors.boardColor,
        borderRadius: AppColors.borderRadius,
      ),
    );
  }
}
