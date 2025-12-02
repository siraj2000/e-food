import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/costum_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/logo/logo.svg",
              color: AppColors.primary,
              height: 35,
            ),
            const Gap(5),
            CostumText(
              text: "Hello Siraj Alshaykhi",
              color: AppColors.search,
              size: 16,
            ),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}
