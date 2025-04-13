import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/themes/app_colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController(text: userName.value);
  bool isEnabled = false;
  
  final ImagePicker _picker = ImagePicker();

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(HugeIcons.strokeRoundedArrowLeft01),
        ),
        title: Text(
          'Настройки профиля',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: userAvatar,
                        builder: (_,value,__) {
                          return value != null ? Stack(
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
                          ) :  Container(
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
                              );
                        }
                      ),
                    ],
                  ),

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
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
                children: [
                  Container(
                    key: ValueKey('edit_save_button'),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isEnabled ? AppColors.indigo: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'Сохранить',
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
                              userName.value = nameController.text;
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ) : SizedBox(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      // border: Border.all(width: 2, color: AppColors.indigo)
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'Отмена',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.indigo
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(14),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}