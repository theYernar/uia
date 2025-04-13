import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/screens/main_screens/profile/edit_profile.dart';
import 'package:uia/screens/onboarding/onboarding_screen.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';
import 'package:uia/themes/app_colors.dart';

import 'landlord/landlord_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      if (userName.value.isEmpty && !_isRedirecting){
        _isRedirecting = true;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder:(context) => EnterPhoneNumberScreen()),
          (route) => false
        );
      } 
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Профиль',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),        
      ),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Center(
              child: ValueListenableBuilder(
                valueListenable: userAvatar,
                builder: (_,avatar,__) {
                  return Stack(
                    children: [
                      avatar != null ? ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(File(userAvatar.value!.path), fit: BoxFit.cover, height: 150, width: 150,),
                      ) : Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: HugeIcon(icon: HugeIcons.strokeRoundedUser, color: Colors.grey, size: 60,),
                      ),
                  
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          key: ValueKey('edit'),
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => EditProfile())
                            );
                          }, 
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black54
                          ),
                          icon: HugeIcon(icon: HugeIcons.strokeRoundedPencilEdit02, color: Colors.white)
                        )
                      )
                    ],
                  );
                }
              ),
            ),
            const SizedBox(height: 20,),
            ValueListenableBuilder(
              valueListenable: userName,
              builder: (_, value, __) {
                return Text(
                  '$value',
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                );
              }
            ),
            ValueListenableBuilder(
              valueListenable: userPhoneNumber,
              builder: (_,value,__) {
                return Text(
                  '+7 $value',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500
                  ),
                );
              }
            ),

            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.indigo, width: 2),
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Стать арендодателем',
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
                          Navigator.of(context).push(
                            MaterialPageRoute(builder:(context) => LandlordScreen(),)
                          );
                        },
                        borderRadius: BorderRadius.circular(14),
                      ),
                    )
                  ],
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Row(
                        children: [
                          Icon(HugeIcons.strokeRoundedLogout03, color: AppColors.indigo,),
                          const SizedBox(width: 10,),
                          Text(
                            'Выйти из аккаунта',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.indigo
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder:(context) =>
                              OnboardingScreeen(),
                            ),
                            (route) => false,
                          );
                          
                          userAvatar.value = null;
                          userName.value = '';
                          userPhoneNumber.value = '';
                        },
                        borderRadius: BorderRadius.circular(14),
                      ),
                    )
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}