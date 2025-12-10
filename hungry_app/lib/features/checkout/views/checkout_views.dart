import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/widgets/payment_selection_widget.dart';
import 'package:hungry_app/l10n/app_localizations.dart';
import 'package:hungry_app/shared/costum_container.dart';
import 'package:hungry_app/shared/costum_text.dart';

class CheckoutViews extends StatefulWidget {
  const CheckoutViews({super.key});

  @override
  State<CheckoutViews> createState() => _CheckoutViewsState();
}

class _CheckoutViewsState extends State<CheckoutViews> {
  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CostumText(
              text: t.translate('order_summary'),
              weight: FontWeight.bold,
              size: 20,
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumText(
                        text: t.translate('order'),
                        size: 16,
                        color: Color(0xff7D7D7D),
                      ),
                      CostumText(
                        text: "\$16.48",
                        size: 16,
                        color: Color(0xff7D7D7D),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumText(
                        text: t.translate('taxes'),
                        size: 16,
                        color: Color(0xff7D7D7D),
                      ),
                      CostumText(
                        text: "\$0.48",
                        size: 16,
                        color: Color(0xff7D7D7D),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumText(
                        text: t.translate('delivery_fees'),
                        size: 16,
                        color: Color(0xff7D7D7D),
                      ),
                      CostumText(
                        text: "\$1.48",
                        size: 16,
                        color: Color(0xff7D7D7D),
                      ),
                    ],
                  ),
                  Gap(20),
                  Container(height: 1, color: Colors.grey.shade300),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumText(
                        text: t.translate('cart_total'),
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                      CostumText(
                        text: "\$18.44",
                        weight: FontWeight.bold,
                        size: 18,
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumText(
                        text: t.translate('estimated_delivery_time'),
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                      CostumText(
                        text: t.translate('delivery_time_value'),
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(60),
            // CostumText(
            //   text: "Payment methods",
            //   size: 20,
            //   weight: FontWeight.bold,
            // ),
            Gap(20),
            PaymentSelectionWidget(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CostumText(
                    text: t.translate('cart_total'),
                    size: 18,
                    weight: FontWeight.bold),
                CostumText(text: t.translate('cart_amount'), size: 16),
              ],
            ),
            const Spacer(),
            CostumContainer(
              text: t.translate('pay_now'),
              color: Colors.white,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(20),
                          Center(
                            child: Icon(
                              Icons.check_circle,
                              color: AppColors.primary,
                              size: 80,
                            ),
                          ),
                          Gap(20),
                          Center(
                            child: CostumText(
                              color: AppColors.primary,
                              text: t.translate('success'),
                              size: 20,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Gap(15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CostumText(
                              text: t.translate('payment_success_message'),
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Gap(50),
                          Center(
                            child: CostumContainer(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              text: t.translate('go_back'),
                              color: Colors.white,
                              width: 180,
                            ),
                          ),
                          Gap(25),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
