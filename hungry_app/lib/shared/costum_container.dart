import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/costum_text.dart';

class CostumContainer extends StatelessWidget {
  const CostumContainer({
    super.key,
    required this.text,
    this.color,
    this.onTap,
    this.size,
    this.width,
    this.bkColor,
  });
  final String text;
  final Color? color;
  final Function()? onTap;
  final double? size;
  final double? width;
  final Color? bkColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bkColor ?? AppColors.primary,
        ),
        child: Center(
          child: CostumText(text: text, color: color, size: size),
        ),
      ),
    );
  }
}
