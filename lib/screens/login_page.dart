import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upload_pic/consts/AppColors.dart';

import '../widgets/AppButton.dart';
import '../widgets/AppTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                if(usernameController.text.isEmpty){
                  
                }
              },
            ),
            const SizedBox(height: 40,), 
            Text('For Assistance & Login Details Contact: ',style: GoogleFonts.poppins().copyWith(fontSize: 14),),
            buildContactMe(text:'English, Kannada & Telugu :',
            phoneNumber: '7406333800'
            ),
            buildContactMe(text:'English, Kannada & Hindi :',
            phoneNumber: '7406333800'
            ),
            const SizedBox(height: 40,), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    buildAboutApp(text: 'v1.7'),
                    buildAboutApp(text: '© 2023,'),
                    buildAboutApp(text: 'Codeland Infosolutions Pvt Ltd.')
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            ],
          ),
        ),
      )
    );
  }

  Widget buildContactMe({required String text,required String phoneNumber}){
    return Row(
              children: [
                Text(text,style: GoogleFonts.poppins()),
                Text(phoneNumber,
                style: GoogleFonts.poppins().copyWith(fontSize: 12,
                decoration: TextDecoration.underline,
                color: AppColors.primaryColor,
                decorationColor: AppColors.primaryColor)),
              ],
      );
  }

  Widget buildAboutApp({required String text}){
    return Text(text,style: GoogleFonts.poppins().copyWith(fontSize: 13),);
  }
}