import 'dart:async';
import 'package:get/get.dart';
import 'package:login/utils/global.colors.dart';

import 'package:flutter/material.dart';
import 'package:login/view/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 20), () {
      Get.to(const LoginView());});
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: const Center(
        child: Text(
          'Day In The Life',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
