import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upload_pic/consts/AppColors.dart';
import 'package:upload_pic/servicelocator.dart';
import 'package:upload_pic/services/user_auth.dart';
import 'package:upload_pic/widgets/toasts.dart';

import '../widgets/AppButton.dart';
import '../widgets/AppTextField.dart';
import '../widgets/Loader.dart';
import 'signup_page.dart';
import 'upload_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserAuthentication userAuthentication = getIt<UserAuthentication>();
  bool isUserLoggedIn = false;

  Future<bool> loginUser({required String username,required String password})async{
    bool? isLoggedIn = await userAuthentication.loginUser(username: username, password: password);
    if(isLoggedIn==true){
      return true;
    }else{
      return false;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal:26.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
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
            
            isUserLoggedIn==true? Loader(): AppButton(
              backgroundColor:AppColors.primaryColor,
              textColor:AppColors.whiteColor,
              title: "Login",
              fontSize: 22,
              onTap: ()async{
                setState(() {
                  isUserLoggedIn = true;
                });
                if(usernameController.text.trim().isEmpty){
                  return Toasts.showWarningToast("User name can't left empty");
                }
                if(passwordController.text.trim().isEmpty){
                  return Toasts.showWarningToast("User name can't left empty");
                }
                bool isSuccess = await loginUser(username: usernameController.text.trim(),password: passwordController.text.trim());
                if(isSuccess){
                  Toasts.showSuccessToast("User Logged in Successfully");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const UploadPhotoPage()));
                }else{
                  setState(() {
                    isUserLoggedIn = false;
                  });
                  return Toasts.showFailureToast(userAuthentication.errorMessage);
                }
              },
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text('Don\'t have an account',style: GoogleFonts.poppins().copyWith(fontSize: 14),),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpPage()));
                }, child: Text('Sign Up',
                style: GoogleFonts.poppins().copyWith(color: AppColors.primaryColor,fontSize: 14),))
              ],
            ),
            const SizedBox(height: 10,), 
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