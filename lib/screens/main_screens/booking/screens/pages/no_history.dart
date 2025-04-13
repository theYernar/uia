import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoHistoryPage extends StatelessWidget {
  const NoHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70,),
        Image.asset('assets/images/woman_yoga.png', width: 280,),
        const SizedBox(height: 15,),
        Text(
          'История пусто',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}