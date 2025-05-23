import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}