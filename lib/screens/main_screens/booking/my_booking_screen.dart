import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/screens/main_screens/booking/screens/active_screen.dart';
import 'package:uia/screens/main_screens/booking/widgets/tab_item.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';
import 'package:uia/themes/app_colors.dart';

import 'screens/history_screen.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
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
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Мои брони',
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),
          ),
      
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xffEEEEEE),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  indicator: BoxDecoration(
                    color: AppColors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  tabs: [
                    TabItem(title: 'Активные'),
                    TabItem(title: 'История')
                  ]
                ),
              ),
            )
          )
        ),
        body: TabBarView(
          children: [
            ActiveScreen(),
            HistoryScreen()
          ]
        ),
      ),
    );
  }
}