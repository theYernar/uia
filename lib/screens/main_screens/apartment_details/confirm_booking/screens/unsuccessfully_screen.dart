import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';
import 'package:uia/themes/app_colors.dart';

class UnsuccessfullyScreen extends StatelessWidget {
  const UnsuccessfullyScreen({super.key});

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
            Center(child: Image.asset('assets/gifs/error.gif', width: 170,)),
            const SizedBox(height: 10,),

            Text(
              'Ошибка',
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
                  'Пожалуйста, зарегистрируйтесь, ',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.grey
                  ),
                ),
                Text(
                  'чтобы продолжить',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.grey
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.indigo,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Зарегистрироваться',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:(context) => EnterPhoneNumberScreen(isMain: false,)
                          ),
                          // (route) => false,
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