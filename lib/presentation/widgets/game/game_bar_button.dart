import 'package:flutter/material.dart';
import 'package:game_2048/resources/resources.dart';

class GameBarButton extends StatelessWidget {
  const GameBarButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.upperCase = true,
  });

  final String text;
  final bool upperCase;
  final VoidCallback onPressed;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 24,
      width: width ?? 84,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.color16,
          shape: const RoundedRectangleBorder(
            borderRadius: AppColors.borderRadius,
          ),
        ),
        child: Text(
          upperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: AppColors.textColorWhite,
            fontSize: 10,
            letterSpacing: -.3,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
