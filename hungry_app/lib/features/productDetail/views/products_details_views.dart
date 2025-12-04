import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/productDetail/widgets/slider_widget.dart';
import 'package:hungry_app/features/productDetail/widgets/toppings_widget.dart';
import 'package:hungry_app/shared/costum_container.dart';
import 'package:hungry_app/shared/costum_text.dart';

class ProductsDetailsViews extends StatefulWidget {
  const ProductsDetailsViews({super.key});

  @override
  State<ProductsDetailsViews> createState() => _ProductsDetailsViewsState();
}

class _ProductsDetailsViewsState extends State<ProductsDetailsViews> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderWidget(
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                value: value,
              ),
              Gap(40),
              CostumText(text: "Toppings", size: 18, weight: FontWeight.bold),
              Gap(10),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return ToppingsWidget(
                      title: 'Tomato',
                      imagePath: 'assets/test/tomato.png',
                      price: 1.20,
                      onAdd: () {
                        // handle add / remove here
                      },
                    );
                  }),
                ),
              ),
              Gap(40),
              CostumText(
                text: "Side options",
                size: 18,
                weight: FontWeight.bold,
              ),
              Gap(10),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return ToppingsWidget(
                      title: 'Tomato',
                      imagePath: 'assets/test/tomato.png',
                      price: 1.20,
                      onAdd: () {
                        // handle add / remove here
                      },
                    );
                  }),
                ),
              ),
              Gap(40),
              Row(
                children: [
                  Column(
                    children: [
                      CostumText(
                        text: "Total",
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                      CostumText(text: "\$ 180", size: 16),
                    ],
                  ),
                  Spacer(),

                  CostumContainer(
                    onTap: () {},
                    text: "Add To Cart",
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
