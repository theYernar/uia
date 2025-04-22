import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uia/database/onboarding_pages_data.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';
import 'package:uia/themes/app_colors.dart';


class OnboardingScreeen extends StatefulWidget {
  const OnboardingScreeen({super.key});

  @override
  State<OnboardingScreeen> createState() => _OnboardingScreeenState();
}

class _OnboardingScreeenState extends State<OnboardingScreeen> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {

    super.initState();
    _pageController = PageController();

    
    _autoScrollTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_currentIndex < onboardingPagesList.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  void dispose() {
    _autoScrollTimer?.cancel(); 
    _pageController.dispose();
    super.dispose();

  }
  
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
                  const SizedBox(height: 100,),
                  SizedBox(
                  height: 510,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: onboardingPagesList.length,
                        onPageChanged: (index){
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder:(context, index) {
                          final onboardingPage = onboardingPagesList[index];
                          return Column(
                            children: [
                              const SizedBox(height: 100,),
                              Image.asset(
                                onboardingPage.image,
                                height: 200,
                              ),
                              const SizedBox(height: 30,),
                              Text(
                                onboardingPage.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                onboardingPage.text,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  color: AppColors.grey,
                                  fontSize: 18
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            onboardingPagesList.length, (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: _currentIndex == index ? 30 : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: _currentIndex == index ? Colors.teal : Colors.grey
                              ),
                            )
                        
                            
                          )
                        )
                      )
                    ],
                  ),
                ),
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