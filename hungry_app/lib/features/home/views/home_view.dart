import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/features/home/widgets/food_category.dart';
import 'package:hungry_app/features/home/widgets/serach_field.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ["All", "Comba", "Sliders", "Classic", "Meal"];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),

                    /// HEADER
                    UserHeader(),
                    const Gap(25),

                    /// SEARCH
                    SerachField(),
                    const Gap(20),

                    /// CATEGORY
                    FoodCategory(selectIndex: selectIndex, category: category),
                    const Gap(20),
                  ],
                ),
              ),
            ),

            /// GRID ITEMS
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 6, (
                  context,
                  index,
                ) {
                  return CardItem(
                    image: "assets/test/test.png",
                    text: "Cheeseburger",
                    des: "Wendy's Burger",
                    rate: "Rating 4.9",
                  );
                }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
