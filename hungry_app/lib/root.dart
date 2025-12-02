// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hungry_app/core/constants/app_colors.dart';
// import 'package:hungry_app/features/auth/views/profile_view.dart';
// import 'package:hungry_app/features/cart/views/cart_view.dart';
// import 'package:hungry_app/features/home/views/home_view.dart';
// import 'package:hungry_app/features/orderHistory/views/order_history_views.dart';

// class Root extends StatefulWidget {
//   const Root({super.key});

//   @override
//   State<Root> createState() => _RootState();
// }

// late PageController controller;

// late List<Widget> screens;
// int currentScreen = 0;

// class _RootState extends State<Root> {
//   @override
//   void initState() {
//     screens = [HomeView(), CartView(), OrderHistoryViews(), ProfileView()];
//     controller = PageController(initialPage: currentScreen);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(controller: controller, children: screens),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: AppColors.primary,
//         type: BottomNavigationBarType.fixed, // كان مادرتش هذي اللون مش ح يطلع

//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey.shade700,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.cart),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.search),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.profile_circled),
//             label: "Home",
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/views/profile_view.dart';
import 'package:hungry_app/features/cart/views/cart_view.dart';
import 'package:hungry_app/features/home/views/home_view.dart';
import 'package:hungry_app/features/orderHistory/views/order_history_views.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  int currentScreen = 0;

  final List<Widget> screens = [
    HomeView(),
    CartView(),
    OrderHistoryViews(),
    ProfileView(),
  ];

  @override
  void initState() {
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          setState(() => currentScreen = index);
        },
        children: screens,
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade900 : AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (index) {
            setState(() => currentScreen = index);
            controller.animateToPage(
              index,
              duration: Duration(milliseconds: 280),
              curve: Curves.easeOut,
            );
          },

          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: AppColors.primary,

          selectedItemColor: Colors.white,
          unselectedItemColor: isDark ? Colors.white70 : Colors.grey.shade600,

          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
