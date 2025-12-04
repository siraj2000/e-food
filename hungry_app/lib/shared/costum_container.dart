import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/costum_text.dart';

class CostumContainer extends StatelessWidget {
  const CostumContainer({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
    this.size,
  });
  final String text;
  final Color color;
  final Function()? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primary,
        ),
        child: CostumText(text: text, color: color, size: size),
      ),
    );
  }
}
