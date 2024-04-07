import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upload_pic/consts/AppColors.dart';

class AppButton extends StatelessWidget {
  double? height;
  double? width;
  Color? backgroundColor;
  Color? textColor;
  String title;
  double? fontSize;
  void Function()? onTap;

   AppButton({
    this.height = 65,
    this.width = double.infinity,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    required this.title,
    required this.fontSize,
    required this.onTap,
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                child: Text(
                title,
                style: GoogleFonts.poppins().copyWith(color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
                ),
                ),
              ),
    );
  }
}