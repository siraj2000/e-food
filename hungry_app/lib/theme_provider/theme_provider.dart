import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get theme => _isDark
      ? ThemeData.dark().copyWith(
          cardColor: Colors.blueGrey,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.black87))
      : ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          cardTheme: CardThemeData(
            color: Colors.white,
          ),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: AppColors.primary),
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
        );

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';

// class ThemeProvider extends ChangeNotifier {
//   bool _isDark = false; // الوضع الافتراضي Light

//   bool get isDark => _isDark;

//   /// ترجيع ThemeData حسب الوضع الحالي
//   ThemeData get theme => _isDark ? _darkTheme : _lightTheme;

//   /// تغيير الوضع بين Light & Dark
//   void toggleTheme() {
//     _isDark = !_isDark;
//     notifyListeners();
//   }

//   /// نوع الخط العام للتطبيق (غيره حسب الخط اللي عندك)
//  // static const String _fontFamily = 'Cairo';

//   /// ----------------------------
//   /// LIGHT THEME
//   /// ----------------------------
//   ThemeData get _lightTheme => ThemeData(
//         brightness: Brightness.light,
//         //fontFamily: _fontFamily,
//         primaryColor: const Color(0xff08431D),
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//         ),
//         cardColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(
//             color: Colors.black,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//           bodyMedium: TextStyle(
//             color: Colors.black87,
//             fontSize: 14,
//           ),
//           titleLarge: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//           labelLarge: TextStyle(
//             color: Colors.black87,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       );

//   /// ----------------------------
//   /// DARK THEME
//   /// ----------------------------
//   ThemeData get _darkTheme => ThemeData(
//         brightness: Brightness.dark,
//         //fontFamily: _fontFamily,
//         primaryColor: Colors.black,
//         scaffoldBackgroundColor: const Color(0xff121212),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Color(0xff121212),
//           foregroundColor: Colors.white,
//           elevation: 0,
//         ),
//         cardColor: const Color(0xff1E1E1E),
//         iconTheme: const IconThemeData(color: Colors.white),
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//           bodyMedium: TextStyle(
//             color: Colors.white70,
//             fontSize: 14,
//           ),
//           titleLarge: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//           labelLarge: TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       );
// }
