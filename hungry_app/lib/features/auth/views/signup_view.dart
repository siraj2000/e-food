import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/costum_btm.dart';
import 'package:hungry_app/l10n/app_localizations.dart';
import 'package:hungry_app/shared/costum_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
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
            /// الخلفية مقسومة نصين (فوق أبيض – تحت أخضر)
            Column(
              children: [
                Expanded(child: Container(color: Colors.white)),
                Expanded(child: Container(color: AppColors.primary)),
              ],
            ),

            /// الفورم في Card بالنص
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/logo/logo.svg",
                            height: 50,
                            color: Colors.green.shade900,
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadiusGeometry.circular(55),
                          //   child: Image.asset(
                          //     "assets/logo.png",
                          //     height: 120,
                          //     width: 120,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          const Gap(10),
                          Text(
                            t.translate('create_account'),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          const Gap(24),

                          /// Name
                          CostumTextfield(
                            hint: t.translate('name'),
                            ispassword: false,
                            controller: nameController,
                          ),
                          const Gap(16),

                          /// Email
                          CostumTextfield(
                            hint: t.translate('email_address'),
                            ispassword: false,
                            controller: emailController,
                          ),
                          const Gap(16),

                          /// Password
                          CostumTextfield(
                            hint: t.translate('password'),
                            ispassword: true,
                            controller: passwordController,
                          ),
                          const Gap(16),

                          /// Confirm Password
                          CostumTextfield(
                            hint: t.translate('confirm_password'),
                            ispassword: true,
                            controller: confirmpasswordController,
                          ),

                          const Gap(28),

                          /// زر التسجيل
                          CostumAuthBtm(
                            text: t.translate('signup'),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                debugPrint("Sign Up success");
                              }
                            },
                          ),

                          const Gap(12),

                          /// تحتها نص بسيط لتسجيل الدخول
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t.translate('already_have_account'),
                                style: const TextStyle(fontSize: 13),
                              ),
                              const SizedBox(width: 6),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  t.translate('sign_in'),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
