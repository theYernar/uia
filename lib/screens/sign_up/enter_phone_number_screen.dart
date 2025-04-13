import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/screens/main_screens/main_screens.dart';
import 'package:uia/themes/app_colors.dart';

// ignore: must_be_immutable
class EnterPhoneNumberScreen extends StatefulWidget {
  bool isMain;
  EnterPhoneNumberScreen({super.key, this.isMain = false});

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {

  TextEditingController phoneNumber = TextEditingController();
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    userPhoneNumber.value = phoneNumber.text;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            widget.isMain ? Navigator.pop(context) : Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreens(initialIndex: 0,)));
          }, 
          icon: Icon(HugeIcons.strokeRoundedArrowLeft01)
        ),
      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    
                    Text(
                      'Вход и Регистрация',
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      'Введите номер телефона для получения SMS-кода и доступа в приложение ',
                      style: GoogleFonts.nunito(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),

                    // Phone Number
                    const SizedBox(height: 20,),
                    TextField(
                      key: ValueKey('phone_field'),
                      controller: phoneNumber,
                      cursorColor: AppColors.indigo,
                      autofocus: true,
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        color: Colors.black
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            isEnabled = value.length == 10;
                          });
                        },
                      decoration: InputDecoration(
                        label: Text(
                          'Номер телефона',
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                        ),
                        prefix: Text(
                          '+7 ',
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 20
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(18),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: AppColors.indigo,
                            width: 2
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),

                      ),
                    )


                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              key: ValueKey('send_sms_button'),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isEnabled ? AppColors.indigo : AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Отправить SMS-код',
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isEnabled ? Colors.white : AppColors.grey
                      ),
                    ),
                  ),
                  isEnabled ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(AppRoutes.enterNameScreen);
                      },
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ) : const SizedBox(),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}