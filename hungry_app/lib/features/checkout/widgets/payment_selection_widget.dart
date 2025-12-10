import 'package:flutter/material.dart';
import 'package:hungry_app/l10n/app_localizations.dart';

class PaymentSelectionWidget extends StatefulWidget {
  const PaymentSelectionWidget({super.key});

  @override
  State<PaymentSelectionWidget> createState() => _PaymentSelectionWidgetState();
}

class _PaymentSelectionWidgetState extends State<PaymentSelectionWidget> {
  String selectedMethod = "cash";
  bool saveCard = false;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.translate('payment_methods'),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        // 🟤 CASH ON DELIVERY
        _paymentOption(
          title: t.translate('cash_on_delivery'),
          icon: Icons.attach_money,
          method: "cash",
          dark: true,
        ),

        const SizedBox(height: 15),

        // 🟦 VISA CARD
        _paymentOption(
          title: t.translate('debit_card'),
          subtitle: t.translate('card_mask'),
          img: "assets/icon/profileVisa.png", // ضع لوجو فيزا
          method: "visa",
          dark: false,
        ),

        const SizedBox(height: 15),

        // 🟥 save card
        Row(
          children: [
            Checkbox(
              value: saveCard,
              activeColor: Colors.red,
              onChanged: (val) {
                setState(() => saveCard = val!);
              },
            ),
            Text(
              t.translate('save_card_details'),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  // ⭐ تصميم بطاقة الدفع
  Widget _paymentOption({
    required String title,
    String? subtitle,
    IconData? icon,
    String? img,
    required String method,
    bool dark = false,
  }) {
    bool isSelected = selectedMethod == method;

    Color bg = dark ? const Color(0xFF3B2A2A) : Colors.white;
    Color textColor = dark ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: () => setState(() => selectedMethod = method),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(18),
          border: isSelected
              ? Border.all(color: Colors.black, width: 1.2)
              : Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon or Image
            if (icon != null)
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(icon, color: Colors.white),
              )
            else if (img != null)
              Image.asset(img, width: 50),

            const SizedBox(width: 15),

            // Titles
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
              ],
            ),

            const Spacer(),

            // Radio selection
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 6,
                backgroundColor: isSelected ? Colors.green : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
