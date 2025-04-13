import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:uia/database/booking_data.dart';
import 'package:uia/screens/main_screens/booking/screens/booking_details/booking_details_screen.dart';
import 'package:uia/themes/app_colors.dart';

import 'pages/no_booking.dart';
import 'widgets/apartmet_images_widget.dart';

class ActiveScreen extends StatelessWidget {
  const ActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child:  
        bookingApartmentData.isEmpty ? NoBookingPage():
        Column(
          children: List.generate(bookingApartmentData.length, (index) {
            final BookingData booking = bookingApartmentData[index];
            // Card
            return IntrinsicHeight(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 8
                    )
                  ]
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    key: ValueKey('booking_details_button'),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder:(context) => BookingDetailsScreen(booking: booking),)
                      );
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                  
                          // Apartment Images
                          ApartmentImagesWidget(apartment: booking),
                                  
                                  
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Номер брони: #${booking.bookingNumber}',
                                  style: GoogleFonts.nunito(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                // Apartment name and rating
                                Text(
                                  booking.title,
                                  style: GoogleFonts.nunito(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                  
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    HugeIcon(icon: HugeIcons.strokeRoundedCalendar03, color: Colors.black),
                                    const SizedBox(width: 5,),
                                    Text(
                                      '${DateFormat('d MMM', 'ru').format(booking.checkInDate!)} - ${DateFormat('d MMM', 'ru').format(booking.checkOutDate!)}',
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                  ),
                ),
                ),
            );
            }  
          ),
        ),
      ),
    );
  }
}