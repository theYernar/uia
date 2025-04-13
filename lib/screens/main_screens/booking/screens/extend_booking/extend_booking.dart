import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uia/screens/main_screens/main_screens.dart';
import 'package:uia/themes/app_colors.dart';



ValueNotifier<DateTime?> checkInDate = ValueNotifier(DateTime.now());


Future<DateTime?> Function(BuildContext) ? customDatePicker;



// Future<DateTime?> Function(BuildContext) ? tes;



class ExtendBooking extends StatefulWidget {
  const ExtendBooking({super.key});

  @override
  State<ExtendBooking> createState() => _ExtendBookingState();
}

class _ExtendBookingState extends State<ExtendBooking> {

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context, int index) async {

    final DateTime? pickedDate = await (customDatePicker != null ?  customDatePicker!(context) 
    :  showDatePicker(
      context: context, 
      firstDate: DateTime(DateTime.now().year), 
      lastDate: DateTime(2026),
    )); 




    if (pickedDate == null) return;

    setState(() {
      if (index == 0){
        checkInDate.value = pickedDate;

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),


      body: Column(
        children: [

           InkWell(
            key: ValueKey('check_in_date_button'),
             borderRadius: BorderRadius.circular(15),
             onTap: () => _selectDate(context, 0),
             child: Container(
              width: double.infinity,
               decoration: BoxDecoration(
                 border: Border.all(color: AppColors.grey),
                 borderRadius: BorderRadius.circular(15)
               ),
               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'Дата заезда',
                     style: GoogleFonts.nunito(
                       color: AppColors.grey,
                       fontSize: 13,
                       fontWeight: FontWeight.w600
                     ),
                   ),
                   Text(
                     checkInDate.value == null ? 'Выберите дату' : DateFormat('d MMMM', 'ru').format(checkInDate.value!),
                     style: GoogleFonts.nunito(
                       fontSize: 16,
                       fontWeight: FontWeight.w600
                     ),
                   ),
                 ],
               ),
             ),
           ),

            Spacer(),
           Container(
              key: ValueKey('save_button'),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.indigo,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Сохранить',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:(context) => MainScreens(initialIndex: 1,),)
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
    );
  }
}