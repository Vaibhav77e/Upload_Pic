import 'package:flutter/material.dart';
import 'package:upload_pic/consts/AppColors.dart';

class Loader extends StatelessWidget {
  double? height;
  double? width;
  Color? backgroundColor;


   Loader({
    this.height = 65,
    this.width = double.infinity,
    this.backgroundColor = AppColors.primaryColor,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
              height: height,
              width:width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              ),
              child: const CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
  }
}