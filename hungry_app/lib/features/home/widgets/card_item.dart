import 'package:flutter/material.dart';
import 'package:hungry_app/shared/costum_text.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.des,
    required this.rate,
  });

  final String image, text, des, rate;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.asset(
              widget.image,
              width: 180, //size.width * 0.4,
            ),
            CostumText(text: widget.text, size: 16, weight: FontWeight.w600),
            CostumText(text: widget.text, size: 16, weight: FontWeight.w400),
            Row(
              children: [
                CostumText(text: widget.rate),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLike = !isLike; // تبديل الحالة
                    });
                  },
                  child: Icon(
                    isLike ? Icons.favorite : Icons.favorite_border,
                    color: isLike ? Colors.red : Colors.grey,
                    size: 26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
