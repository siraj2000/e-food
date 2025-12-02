import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/costum_btm.dart';
import 'package:hungry_app/shared/costum_textfield.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(190),
                  SvgPicture.asset("assets/logo/logo.svg"),
                  Gap(10),
                  // CostumText(
                  //   color: Colors.white,
                  //   size: 16,
                  //   text: "Welcome Back , Discover The Fast Food ",
                  //   weight: FontWeight.w500,
                  // ),
                  Gap(40),

                  CostumTextfield(
                    hint: "Name ",
                    ispassword: false,
                    controller: nameController,
                  ),
                  Gap(20),
                  CostumTextfield(
                    hint: "Email Address",
                    ispassword: false,
                    controller: emailController,
                  ),
                  Gap(20),
                  CostumTextfield(
                    hint: "password",
                    ispassword: false,
                    controller: passwordController,
                  ),
                  Gap(20),
                  CostumTextfield(
                    hint: "confirm password",
                    ispassword: true,
                    controller: confirmpasswordController,
                  ),
                  Gap(50),

                  CostumAuthBtm(
                    text: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print(" Login Suuuuuuuu");
                      }
                    },
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     if (formKey.currentState!.validate()) {
                  //       print(" Login Suuuuuuuu");
                  //     }
                  //   },
                  //   child: Container(
                  //     height: 55,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.white,
                  //     ),

                  //     child: Center(
                  //       child: CostumText(
                  //         text: "Signb up ",
                  //         color: AppColors.primary,
                  //         size: 16,
                  //         weight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
