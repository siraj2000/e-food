import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/checkout/widgets/payment_selection_widget.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CostumText(
              text: "Order summary",
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
                        text: "Order",
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
                        text: "Taxes",
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
                        text: "Delivery fees",
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
                        text: "Total",
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
                        text: "Estimated delivery time:",
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                      CostumText(
                        text: "20-30 minutes",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumText(text: "Total", size: 18, weight: FontWeight.bold),
                CostumText(text: "\$ 180", size: 16),
              ],
            ),

            const Spacer(),

            CostumContainer(
              text: "Pay Now",
              color: Colors.white,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CostumText(
                            text: "Success",
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                          CostumText(
                            text: "Your order has been placed successfully",
                            size: 16,
                          ),
                          CostumText(
                            text: "Thank you for your purchase",
                            size: 16,
                          ),
                          CostumText(
                            text:
                                "You will receive an email with your order details",
                            size: 16,
                          ),
                          CostumText(
                            text:
                                "You will receive an email with your order details",
                            size: 16,
                          ),
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
