import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uia/themes/app_colors.dart';

class NoBookingPage extends StatelessWidget {
  const NoBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70,),
        Image.asset('assets/images/chill_man.png', width: 280,),
        const SizedBox(height: 15,),
        Text(
          'У вас нет активных броней',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10,),

        Text(
          'Забронируйте для себя апартмент из',
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: AppColors.grey
          ),
        ),
        Text(
          'списка в разделе "Главное"',
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: AppColors.grey
          ),
        ),
      ],
    );
  }
}