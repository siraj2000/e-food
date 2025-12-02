import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/costum_text.dart';

class CostumAuthBtm extends StatelessWidget {
  const CostumAuthBtm({super.key, this.onTap, required this.text});

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),

        child: Center(
          child: CostumText(
            text: text,
            color: AppColors.primary,
            size: 16,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
