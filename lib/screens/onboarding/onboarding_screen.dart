import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';
import 'package:uia/themes/app_colors.dart';


class OnboardingScreeen extends StatefulWidget {
  const OnboardingScreeen({super.key});

  @override
  State<OnboardingScreeen> createState() => _OnboardingScreeenState();
}

class _OnboardingScreeenState extends State<OnboardingScreeen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  // Person using laptop image
                  const SizedBox(height: 140,),
                  Image.asset('assets/images/person_using_laptop.png', width: 340,),
                
                  // Text
                  const SizedBox(height: 20,),
                  Text(
                    'Почувствуйте себя',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'как дома',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        'Наше приложение поможет ',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'вам найти',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'не просто жилье, а настоящий дом',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontSize: 18
                        ),
                      ),
                      

                    ],
                  )
                ],
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  key: const ValueKey('login_button'),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.indigo,
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'Войти',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:(context) => EnterPhoneNumberScreen(isMain: true,),)
                            );
                          },
                          borderRadius: BorderRadius.circular(14),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                   key: const ValueKey('skip_button'),
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
                          'Пропустить',
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
                            Navigator.of(context).pushNamed(AppRoutes.mainScreens);
                          },
                          borderRadius: BorderRadius.circular(14),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}