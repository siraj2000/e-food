// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hungry_app/core/constants/app_colors.dart';
// import 'package:hungry_app/features/home/widgets/card_item.dart';
// import 'package:hungry_app/features/home/widgets/food_category.dart';
// import 'package:hungry_app/features/home/widgets/serach_field.dart';
// import 'package:hungry_app/features/home/widgets/user_header.dart';
// import 'package:hungry_app/features/productDetail/views/products_details_views.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   List category = ["All", "Comba", "Sliders", "Classic", "Meal"];

//   int selectIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Gap(40),

//                     /// HEADER
//                     UserHeader(),
//                     const Gap(25),

//                     /// SEARCH
//                     SerachField(),
//                     const Gap(20),

//                     /// CATEGORY
//                     FoodCategory(selectIndex: selectIndex, category: category),
//                     const Gap(20),
//                   ],
//                 ),
//               ),
//             ),

//             /// GRID ITEMS
//             SliverPadding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               sliver: SliverGrid(
//                 delegate: SliverChildBuilderDelegate(childCount: 10, (
//                   context,
//                   index,
//                 ) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProductsDetailsViews(),
//                         ),
//                       );
//                     },
//                     child: CardItem(
//                       image: "assets/test/test.png",
//                       text: "Cheeseburger",
//                       des: "Wendy's Burger",
//                       rate: "Rating 4.9",
//                     ),
//                   );
//                 }),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.66,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/features/home/widgets/food_category.dart';
import 'package:hungry_app/features/home/widgets/serach_field.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';
import 'package:hungry_app/features/productDetail/views/products_details_views.dart';
import 'package:hungry_app/l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    final List<String> categories = [
      t.translate('cat_all'),
      t.translate('cat_combo'),
      t.translate('cat_sliders'),
      t.translate('cat_classic'),
      t.translate('cat_meal'),
    ];

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
                    const UserHeader(),
                    const Gap(25),

                    /// SEARCH
                    const SerachField(),
                    const Gap(20),

                    /// CATEGORY
                    FoodCategory(
                      selectIndex: selectIndex,
                      category: categories,
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),

            /// GRID ITEMS
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductsDetailsViews(),
                          ),
                        );
                      },
                      child: CardItem(
                        image: "assets/test/test.png",
                        text: t.translate('product_title'),
                        des: t.translate('product_description'),
                        rate: t.translate('product_rating'),
                      ),
                    );
                  },
                ),
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
