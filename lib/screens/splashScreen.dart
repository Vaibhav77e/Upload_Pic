import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/AppColors.dart';
import 'login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Container(
          width:290,
          height: 430,
          decoration: BoxDecoration(color: AppColors.whiteColor,borderRadius: BorderRadius.circular(80)),
          child: Padding(
           padding: const EdgeInsets.symmetric(horizontal:  32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 200,child: Image.asset('assets/logo.png'),),
                    SizedBox(
                      child: Image.asset('assets/codeland.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}