import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/themes/app_colors.dart';
import 'favorites/favorites_screen.dart';
import 'profile/profile_screen.dart';
import 'booking/my_booking_screen.dart';

import 'home/home_screen.dart';

class MainScreens extends StatefulWidget {
  final int initialIndex;
  const MainScreens({super.key, this.initialIndex = 0});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  late int _selectedIndex;

  @override
  void initState() {

    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  List<Widget> screens = [
    HomeScreen(),
    MyBookingScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ]; 

  void onTab(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(color: AppColors.grey, height: 0.5, width: double.infinity,),
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedHome01), label: 'Главная'),
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedTask01), label: 'Мои брони'),
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedFavourite), label: 'Избранные'),
              BottomNavigationBarItem(key: ValueKey('profile'), icon: Icon(HugeIcons.strokeRoundedUser), label: 'Профиль'),
            ],

            onTap: onTab,
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.indigo,
            unselectedItemColor: AppColors.grey,
            iconSize: 28,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            selectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.w600
            ),
            unselectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.w500
            ),
            type: BottomNavigationBarType.fixed,
            // elevation: 10,
            // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            useLegacyColorScheme: true,
          ),
        ],
      ),
    );
  }
}