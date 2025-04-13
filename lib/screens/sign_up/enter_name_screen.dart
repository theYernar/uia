import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/themes/app_colors.dart';


// XFile? image;


class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  TextEditingController nameController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  bool isEnabled = false;

  Future<void> pickImage() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery); // или .camera
    
    if (_image != null) {
      setState(() {
        userAvatar.value = _image;
        if (nameController.text.length > 3){
          isEnabled = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    userName.value = nameController.text;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      const SizedBox(height: 30,),
                      // Text
                      Text(
                        'Заполните свои данные',
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        'Чтобы получить доступ к арендам квартир,',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'предоставьте следующие данные',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),
                      ),


                      const SizedBox(height: 20,),
                      // Upload Photo

                      userAvatar.value != null ? Stack(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(File(userAvatar.value!.path), fit: BoxFit.cover, height: 150, width: 150,),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  userAvatar.value = null;
                                  if (nameController.text.length > 3){
                                    isEnabled = true;
                                  }
                                });
                              }, 
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black54
                              ),
                              icon: HugeIcon(icon: HugeIcons.strokeRoundedDelete01, color: Colors.white)
                            )
                          )
                        ],
                      ) : Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.buttonBackgroundColor,
                          borderRadius: BorderRadius.circular(35)
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: HugeIcon(icon: HugeIcons.strokeRoundedCamera01, color: AppColors.grey, size: 40,),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: pickImage,
                                borderRadius: BorderRadius.circular(35),
                              ),
                            )
                          ],
                        ) ,
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'Фотография профиля',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontSize: 16
                        ),
                      ),

                      // Enter name
                      const SizedBox(height: 25,),
                      TextField(
                        key: ValueKey('name_field'),
                        controller: nameController,
                        cursorColor: AppColors.indigo,
                        autofocus: true,
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          color: Colors.black
                        ),
                        onChanged: (value) {
                          setState(() {
                            isEnabled = value.length > 2;
                          });
                        },
                        decoration: InputDecoration(
                          label: Text(
                            'Имя',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                          ),

                          contentPadding: const EdgeInsets.all(18),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: AppColors.indigo,
                              width: 2
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                key: ValueKey('registration_button'),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isEnabled ? AppColors.indigo : AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Зарегистрироваться',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: isEnabled ? Colors.white : AppColors.grey
                        ),
                      ),
                    ),
                    isEnabled ? Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(AppRoutes.mainScreens);
                        },
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ) : const SizedBox(),
                  ],
                ),
              )
            ),
        
          ],
        ),
      ),
    );
  }
}