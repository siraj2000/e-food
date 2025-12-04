import 'package:flutter/material.dart';

/// Tomato-style ingredient card
class ToppingsWidget extends StatefulWidget {
  final String title;
  final String imagePath; // asset path
  final double? price; // optional extra info
  final VoidCallback? onAdd;

  const ToppingsWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.price,
    this.onAdd,
  });

  @override
  State<ToppingsWidget> createState() => _ToppingsWidgetState();
}

class _ToppingsWidgetState extends State<ToppingsWidget> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    const bottomColor = Color(0xFF3B2A2A); // dark brown strip
    const accentRed = Color(0xFFFF3B3B); // red + button

    return GestureDetector(
      onTap: () {
        // tap on the whole card = toggle added
        setState(() => _added = !_added);
        if (widget.onAdd != null) widget.onAdd!();
      },
      child: AnimatedScale(
        scale: _added ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 140,
          height: 155,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                // TOP: white rounded area with tomato image
                Expanded(
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Hero(
                      tag: widget.title, // advanced: hero animation support
                      child: Image.asset(widget.imagePath, fit: BoxFit.contain),
                    ),
                  ),
                ),

                // BOTTOM: dark bar with title + round red + button
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: const BoxDecoration(color: bottomColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title & optional price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                          if (widget.price != null)
                            Text(
                              '\$${widget.price!.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15,
                              ),
                            ),
                        ],
                      ),

                      // Circular add button
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() => _added = !_added);
                            if (widget.onAdd != null) widget.onAdd!();
                          },
                          customBorder: const CircleBorder(),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _added ? Colors.white : accentRed,
                            ),
                            child: Icon(
                              _added ? Icons.check : Icons.add,
                              size: 20,
                              color: _added ? accentRed : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
