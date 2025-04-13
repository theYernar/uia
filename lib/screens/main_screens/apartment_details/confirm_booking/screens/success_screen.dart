import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/screens/main_screens/main_screens.dart';
import 'package:uia/themes/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: ()=>Navigator.of(context).pushNamed(AppRoutes.mainScreens),
              icon: Icon(HugeIcons.strokeRoundedCancel01)
            )
          ],
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(height: 120,),
            Center(child: Image.asset('assets/gifs/success.gif', width: 170,)),
            const SizedBox(height: 10,),

            Text(
              'Оплата успешно прошло',
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  'Чтобы посмотреть апартамент перейдите',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.grey
                  ),
                ),
                Text(
                  'в Мои Брони',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.grey
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              key: ValueKey('my_booking_button'),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.indigo,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(HugeIcons.strokeRoundedTask01, color: Colors.white,),
                      const SizedBox(width: 10,),
                      Text(
                        'В мои брони',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder:(context) => MainScreens(initialIndex: 1,),
                          ),
                          (route) => false,
                        );
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
    );

  }
}