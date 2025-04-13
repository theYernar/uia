import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uia/themes/app_colors.dart';

class NoFavoritesPage extends StatelessWidget {
  const NoFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70,),
        Center(child: Image.asset('assets/images/women_using_phone.png', width: 280,)),
        const SizedBox(height: 15,),
        Text(
          'В избранных пусто',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10,),



        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Добавляйте сюда апартаменты ',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppColors.grey
              ),
            ),
            Text(
              'чтобы не потерять',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppColors.grey
              ),
            ),
            Text(
              'нажав на сердечку',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppColors.grey
              ),
            ),
            Text(
              ' на карточке',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppColors.grey
              ),
            ),
          ],
        )
        
      ],
    );
  }
}