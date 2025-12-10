import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/l10n/app_localizations.dart';
import 'package:hungry_app/shared/costum_container.dart';
import 'package:hungry_app/shared/costum_text.dart';

class OrderHistoryViews extends StatelessWidget {
  const OrderHistoryViews({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.only(bottom: 120, top: 10),
        itemBuilder: (context, index) {
          return Card(
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/test/test.png", width: 90),
                          // CostumText(text: "Hamburger", weight: FontWeight.bold),
                          // CostumText(text: "Veggie Burger"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CostumText(
                            text: t.translate('cart_item_name'),
                            weight: FontWeight.bold,
                          ),
                          CostumText(text: "${t.translate('qty')}: 3 "),
                          CostumText(text: "${t.translate('price')} : 20\$"),
                        ],
                      ),
                    ],
                  ),
                  Gap(20),
                  CostumContainer(
                    bkColor: Colors.grey.shade400,
                    text: t.translate('re_order'),
                    width: double.infinity,
                  ),
                  Gap(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
