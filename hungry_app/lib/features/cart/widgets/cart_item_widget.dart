// // import 'package:flutter/material.dart';

// // class CartItemCard extends StatefulWidget {
// //   final String imagePath;
// //   final String title;
// //   final String subtitle;
// //   final int initialCount;
// //   final VoidCallback? onRemove;

// //   const CartItemCard({
// //     super.key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.subtitle,
// //     this.initialCount = 1,
// //     this.onRemove,
// //   });

// //   @override
// //   State<CartItemCard> createState() => _CartItemCardState();
// // }

// // class _CartItemCardState extends State<CartItemCard> {
// //   late int count;

// //   @override
// //   void initState() {
// //     super.initState();
// //     count = widget.initialCount;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final width = MediaQuery.of(context).size.width;

// //     return AnimatedContainer(
// //       duration: const Duration(milliseconds: 250),
// //       curve: Curves.easeOut,
// //       padding: EdgeInsets.all(width * 0.03),
// //       margin: EdgeInsets.symmetric(vertical: width * 0.015),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(width * 0.05),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.07),
// //             blurRadius: 10,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           // 🖼 صورة المنتج
// //           ClipRRect(
// //             borderRadius: BorderRadius.circular(width * 0.03),
// //             child: Image.asset(
// //               widget.imagePath,
// //               width: width * 0.18,
// //               height: width * 0.18,
// //               fit: BoxFit.contain,
// //             ),
// //           ),

// //           SizedBox(width: width * 0.03),

// //           // 📝 العنوان والوصف
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   widget.title,
// //                   style: TextStyle(
// //                     fontSize: width * 0.045,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 Text(
// //                   widget.subtitle,
// //                   style: TextStyle(
// //                     fontSize: width * 0.035,
// //                     color: Colors.grey[700],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),

// //           SizedBox(width: width * 0.02),

// //           // ➖ 2 ➕  (العداد)
// //           Column(
// //             children: [
// //               Row(
// //                 children: [
// //                   _counterButton(
// //                     icon: Icons.remove,
// //                     onPressed: () {
// //                       setState(() {
// //                         if (count > 1) count--;
// //                       });
// //                     },
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.symmetric(horizontal: width * 0.03),
// //                     child: Text(
// //                       '$count',
// //                       style: TextStyle(
// //                         fontSize: width * 0.05,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                   _counterButton(
// //                     icon: Icons.add,
// //                     onPressed: () {
// //                       setState(() {
// //                         count++;
// //                       });
// //                     },
// //                   ),
// //                 ],
// //               ),

// //               SizedBox(height: width * 0.03),

// //               // 🟩 زر الحذف
// //               GestureDetector(
// //                 onTap: widget.onRemove,
// //                 child: AnimatedContainer(
// //                   duration: const Duration(milliseconds: 200),
// //                   padding: EdgeInsets.symmetric(
// //                     horizontal: width * 0.08,
// //                     vertical: width * 0.025,
// //                   ),
// //                   decoration: BoxDecoration(
// //                     color: Colors.green.shade900,
// //                     borderRadius: BorderRadius.circular(width * 0.03),
// //                   ),
// //                   child: Text(
// //                     "Remove",
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: width * 0.04,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // 🔘 زر العداد
// //   Widget _counterButton({
// //     required IconData icon,
// //     required VoidCallback onPressed,
// //   }) {
// //     final width = MediaQuery.of(context).size.width;

// //     return GestureDetector(
// //       onTap: onPressed,
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 150),
// //         width: width * 0.10,
// //         height: width * 0.10,
// //         decoration: BoxDecoration(
// //           color: Colors.green.shade900,
// //           borderRadius: BorderRadius.circular(width * 0.02),
// //         ),
// //         child: Icon(icon, color: Colors.white, size: width * 0.055),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hungry_app/core/constants/app_colors.dart';
// import 'package:hungry_app/shared/costum_text.dart';

// class CartItemWidget extends StatefulWidget {
//   const CartItemWidget({
//     super.key,
//     required this.image,
//     required this.text,
//     required this.des,
//     this.onAdd,
//     this.onRemove,
//     this.onMin,
//   });
//   final String image, text, des;
//   final Function()? onAdd;
//   final Function()? onRemove;
//   final Function()? onMin;

//   @override
//   State<CartItemWidget> createState() => _CartItemWidgetState();
// }

// class _CartItemWidgetState extends State<CartItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return Card(
//       elevation: 4,
//       color: Colors.white,

//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   widget.image,
//                   width: 100,
//                   // height: 100,
//                 ),
//                 CostumText(text: widget.text, weight: FontWeight.bold),
//                 CostumText(text: widget.des),
//               ],
//             ),

//             Column(
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: widget.onAdd,
//                       child: CircleAvatar(
//                         backgroundColor: AppColors.primary,
//                         child: Icon(Icons.add, color: Colors.white),
//                       ),
//                     ),
//                     Gap(20),
//                     CostumText(text: "2", weight: FontWeight.bold, size: 18),
//                     Gap(20),
//                     GestureDetector(
//                       onTap: widget.onMin,
//                       child: CircleAvatar(
//                         backgroundColor: AppColors.primary,
//                         child: Icon(Icons.remove_sharp, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(15),
//                 GestureDetector(
//                   onTap: widget.onRemove,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: width * 0.07,
//                       vertical: width * 0.027,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       borderRadius: BorderRadius.circular(width * 0.05),
//                     ),
//                     child: Text(
//                       "Remove",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: width * 0.04,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/costum_text.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.image,
    required this.text,
    required this.des,
  });

  final String image, text, des;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final cart = Provider.of<CartProvider>(context);

    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IMAGE + TEXT
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 90),
                CostumText(text: text, weight: FontWeight.bold),
                CostumText(text: des),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    // ➕
                    GestureDetector(
                      onTap: cart.increase,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),

                    const Gap(20),

                    // الرقم
                    CostumText(
                      text: cart.number.toString(),
                      size: 18,
                      weight: FontWeight.bold,
                    ),

                    const Gap(20),

                    // ➖
                    GestureDetector(
                      onTap: cart.decraese,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const Gap(15),

                // REMOVE
                GestureDetector(
                  onTap: () {},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07,
                      vertical: width * 0.027,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(width * 0.05),
                    ),
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
