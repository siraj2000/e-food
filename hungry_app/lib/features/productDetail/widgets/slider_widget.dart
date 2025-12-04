import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/costum_text.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.asset(
          "assets/detail/sandwitch_detail.png",
          width: size.width * 0.4,
        ),
        Spacer(),
        Column(
          children: [
            CostumText(
              text:
                  "Customize Your Burger\n to Your Tastes. Ultimate\n Experience",
            ),
            Slider(
              //thumbColor: Colors.red,
              min: 0.0,
              max: 100,
              value: widget.value,
              inactiveColor: Colors.grey.shade300,
              activeColor: AppColors.primary,
              onChanged: widget.onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
