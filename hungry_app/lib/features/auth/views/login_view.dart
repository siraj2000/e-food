// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:hungry_app/core/constants/app_colors.dart';
// import 'package:hungry_app/features/auth/widgets/costum_btm.dart';
// import 'package:hungry_app/shared/costum_text.dart';
// import 'package:hungry_app/shared/costum_textfield.dart';

// class LoginView extends StatelessWidget {
//   LoginView({super.key});

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         backgroundColor: AppColors.primary,
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   Gap(190),
//                   SvgPicture.asset("assets/logo/logo.svg"),
//                   Gap(10),
//                   CostumText(
//                     color: Colors.white,
//                     size: 16,
//                     text: "Welcome Back , Discover The Fast Food ",
//                     weight: FontWeight.w500,
//                   ),
//                   Gap(40),

//                   CostumTextfield(
//                     hint: "Email Address",
//                     ispassword: false,
//                     controller: emailController,
//                   ),
//                   Gap(20),
//                   CostumTextfield(
//                     hint: "Password ",
//                     ispassword: true,
//                     controller: passwordController,
//                   ),
//                   Gap(20),

//                   // GestureDetector(
//                   //   onTap: () {
//                   //     if (formKey.currentState!.validate()) {
//                   //       print(" Login Suuuuuuuu");
//                   //     }
//                   //   },
//                   //   child: Container(
//                   //     height: 55,
//                   //     width: double.infinity,
//                   //     decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(10),
//                   //       color: Colors.white,
//                   //     ),

//                   //     child: Center(
//                   //       child: CostumText(
//                   //         text: "Login ",
//                   //         color: AppColors.primary,
//                   //         size: 16,
//                   //         weight: FontWeight.w500,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   CostumAuthBtm(
//                     text: "Login",
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         print(" Login Suuuuuuuu");
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/views/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/costum_btm.dart';
import 'package:hungry_app/l10n/app_localizations.dart';
import 'package:hungry_app/shared/costum_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            /// الخلفية: نص أبيض، نص أخضر
            Column(
              children: [
                Expanded(child: Container(color: Colors.white)),
                Expanded(child: Container(color: AppColors.primary)),
              ],
            ),

            /// الـ Card في الوسط
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    /// النموذج
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          /// Logo
                          SvgPicture.asset("assets/logo/logo.svg", height: 60),
                          const Gap(10),

                          Text(
                            t.translate('welcome_back'),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),

                          const Gap(26),

                          /// Email Field
                          CostumTextfield(
                            hint: t.translate('email_address'),
                            ispassword: false,
                            controller: emailController,
                          ),
                          const Gap(18),

                          /// Password Field
                          CostumTextfield(
                            hint: t.translate('password'),
                            ispassword: true,
                            controller: passwordController,
                          ),

                          const Gap(12),

                          /// Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // TODO: Forgot password logic
                              },
                              child: Text(
                                t.translate('forgot_password'),
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),

                          const Gap(30),

                          /// Login Button
                          CostumAuthBtm(
                            text: t.translate('login'),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                debugPrint("Logged in successfully");
                              }
                            },
                          ),

                          const Gap(12),

                          /// Go to Sign Up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t.translate('dont_have_account'),
                                style: const TextStyle(fontSize: 13),
                              ),
                              const SizedBox(width: 6),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  t.translate('signup'),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
