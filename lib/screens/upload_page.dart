import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_pic/consts/AppColors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:upload_pic/widgets/AppButton.dart';
import 'package:upload_pic/widgets/toasts.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({super.key});

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File? _image;
  File? _showImage;

  final picker = ImagePicker();

  //Image Picker function to get image from gallery
Future getImageFromGallery() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  });
}

Future showImage()async {
  setState(() {
    _showImage=_image;
  });
}

Future clearImage()async{
  setState(() {
    _image=null;
    _showImage=null;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(  
              children: [
              const SizedBox(height: 20,),
              Text('Upload a image',style: GoogleFonts.poppins().copyWith(fontSize: 20,fontWeight: FontWeight.w600),),
              const SizedBox(height: 50,),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                dashPattern:const [10, 10],
                color: Colors.grey,
                strokeWidth: 2,
                 child:SizedBox(
                  height: 500,
                  width: double.infinity,
                   child:_showImage==null? Center(
                    child:SizedBox(
                      height: 100,
                      child: Image.asset('assets/photoupload.png'),
                    )
                    ):ClipRRect(
                      borderRadius:BorderRadius.circular(20) ,
                      child: Image.file(_showImage!,fit: BoxFit.cover,)),
                 ),
              ),
               SizedBox(height:_showImage==null? 80:60,),
              _showImage!=null?GestureDetector(onTap: clearImage,
              child:const CircleAvatar(
                backgroundColor: AppColors.buttonColor,
                child: Text('X'),
              ),):const SizedBox(),
               SizedBox(height: _showImage==null? 0:40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                    height: 50,
                    width: 150,
                    title: 'Upload', fontSize: 15, onTap:getImageFromGallery),
                  AppButton(
                    height: 50,
                    width: 150,
                    title: 'View', 
                    fontSize: 15,
                    textColor: Colors.black,
                    backgroundColor: AppColors.buttonColor,
                    onTap: (){
                      if(_image!=null){
                        showImage();
                      }else{
                        return Toasts.showWarningToast("Please upload the image for the preview");
                      }
                    }),
                ],
              )
            ],),
          ),
        ),
      ),
    );
  }
}