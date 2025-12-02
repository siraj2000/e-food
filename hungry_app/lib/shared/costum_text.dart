import 'package:flutter/material.dart';

class CostumText extends StatelessWidget {
  CostumText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });

  final String text;
  late Color? color;
  final double? size;
  FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
