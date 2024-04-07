import 'package:flutter/material.dart';

import '../consts/AppColors.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Container(
          width:250,
          height: 380,
          decoration: BoxDecoration(color: AppColors.whiteColor,borderRadius: BorderRadius.circular(36)),
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}