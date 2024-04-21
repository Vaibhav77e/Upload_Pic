import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upload_pic/consts/AppColors.dart';
import 'package:upload_pic/screens/login_page.dart';

import '../widgets/AppButton.dart';
import '../widgets/AppTextField.dart';
import 'upload_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:26.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              SizedBox(
              height: 430,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:  45.0),
                    child: Image.asset('assets/codeland.png'),
                  ),
                  SizedBox(
                    height: 220,child: Image.asset('assets/logo.png'),),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Biomedical  Kiosk',style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w700,fontSize: 20),),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(right:50.0),
                child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Text('for HCE\'s',style: GoogleFonts.poppins().copyWith(color: AppColors.primaryColor,fontSize: 12),)
                      ],),
              ),
            const SizedBox(height: 10,),
            AppTextField(controller: nameController, hintText: "Name"),
            const SizedBox(height: 10,),
            AppTextField(controller: usernameController,hintText: "Username",),
            const SizedBox(height: 20,),  
            AppTextField(controller: passwordController,hintText: "Password",),
            const SizedBox(height: 30,), 
            AppButton(
              backgroundColor:AppColors.primaryColor,
              textColor:AppColors.whiteColor,
              title: "Login",
              fontSize: 22,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UploadPhotoPage()));
              },
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text('Already have an account',style: GoogleFonts.poppins().copyWith(fontSize: 14),),
                TextButton(onPressed: (){
                  
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                }, child: Text('Sign Up',
                style: GoogleFonts.poppins().copyWith(color: AppColors.primaryColor,fontSize: 14),))
              ],
            ),
            const SizedBox(height: 20,),
            ],
          ),
        ),
      )
    );
  }

}