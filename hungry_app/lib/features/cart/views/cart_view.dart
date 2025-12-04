// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import 'package:hungry_app/features/cart/widgets/cart_item_widget.dart';
// import 'package:hungry_app/shared/costum_container.dart';
// import 'package:hungry_app/shared/costum_text.dart';

// class CartView extends StatelessWidget {
//   const CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             // Gap(100),
//             SingleChildScrollView(
//               child: Column(
//                 children: List.generate(5, (index) {
//                   return CartItemWidget(
//                     image: "assets/test/test.png",
//                     des: "Veggie Burger",
//                     text: "Hamburger",
//                   );
//                 }),
//               ),
//             ),
//             Spacer(),
//             ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import 'package:hungry_app/features/cart/widgets/cart_item_widget.dart';
// import 'package:hungry_app/shared/costum_container.dart';
// import 'package:hungry_app/shared/costum_text.dart';

// class CartView extends StatelessWidget {
//   const CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             /// ✔️ الـ ListView هي اللي تتكفل بالسكرول
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 5,
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return CartItemWidget(
//                     image: "assets/test/test.png",
//                     des: "Veggie Burger",
//                     text: "Hamburger",
//                   );
//                 },
//               ),
//             ),

//             /// باقي الصفحة تحت
//             const Gap(10),

//             // مثال لو عندك زر Checkout
//             // CustomButton(text: "Checkout", onTap: () {})
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/cart/provider/cart_provider.dart';

import 'package:hungry_app/features/cart/widgets/cart_item_widget.dart';
import 'package:hungry_app/shared/costum_container.dart';
import 'package:hungry_app/shared/costum_text.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            /// قائمة المنتجات
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 5,
            //     physics: const BouncingScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return CartItemWidget(
            //         image: "assets/test/test.png",
            //         des: "Veggie Burger",
            //         text: "Hamburger",
            //         onAdd: () {

            //         },

            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider(
                    create: (_) => CartProvider(),
                    child: CartItemWidget(
                      image: "assets/test/test.png",
                      des: "Veggie Burger",
                      text: "Hamburger",
                    ),
                  );
                },
              ),
            ),

            const Gap(80), // عشان تترك مساحة للـ bottomSheet
          ],
        ),
      ),

      /// الحل هنا: استخدم Container بدل bottomSheet مباشرة
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
              text: "Add To Cart",
              color: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
