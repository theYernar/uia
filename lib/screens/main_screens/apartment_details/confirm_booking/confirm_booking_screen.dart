import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:uia/database/apartment_data.dart';
import 'package:uia/database/booking_data.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/screens/main_screens/apartment_details/confirm_booking/screens/success_screen.dart';
import 'package:uia/screens/main_screens/apartment_details/confirm_booking/screens/unsuccessfully_screen.dart';
import 'package:uia/screens/main_screens/apartment_details/widgets/apartment_image_widget.dart';
import 'package:uia/themes/app_colors.dart';

class ConfirmBookingScreen extends StatelessWidget {
  final ApartmentData apartment;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final ValueListenable<int> totalDays;
  const ConfirmBookingScreen(
      {super.key,
      required this.apartment,
      this.checkInDate,
      this.checkOutDate,
      required this.totalDays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(HugeIcons.strokeRoundedArrowLeft01)),
        title: Text(
          'Подтверждение брони',
          style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image View
                Container(
                    height: 270,
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: ApartmentImage(apartment: apartment)),

                // Apartment title
                const SizedBox(
                  height: 10,
                ),
                Text(
                  apartment.title,
                  style: GoogleFonts.nunito(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),

                Text(
                  apartment.comment,
                ),

                const SizedBox(
                  height: 30,
                ),

                Text(
                  'Дата бронирование',
                  style: GoogleFonts.nunito(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),

                // ============== Booking Date ============== //
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дата заезда',
                            style: GoogleFonts.nunito(
                                color: AppColors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            DateFormat('EE, d MMMM', 'ru').format(checkInDate!),
                            style: GoogleFonts.nunito(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дата выезда',
                            style: GoogleFonts.nunito(
                                color: AppColors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            DateFormat('EE, d MMMM', 'ru')
                                .format(checkOutDate!),
                            style: GoogleFonts.nunito(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: AppColors.buttonBackgroundColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Итоговая сумма',
                  style: GoogleFonts.nunito(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ValueListenableBuilder(
                    valueListenable: totalDays,
                    builder: (_, days, __) {
                      final int totalPrice = apartment.price * days;
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${apartment.price} ₸ x $days ночей',
                                style: GoogleFonts.nunito(
                                    fontSize: 16, color: AppColors.grey),
                              ),
                              const Spacer(),
                              Text(
                                '$totalPrice ₸',
                                style: GoogleFonts.nunito(
                                    fontSize: 16, color: AppColors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: AppColors.buttonBackgroundColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Общая сумма',
                                style: GoogleFonts.nunito(
                                    fontSize: 16, color: AppColors.grey),
                              ),
                              const Spacer(),
                              Text(
                                '$totalPrice ₸',
                                style: GoogleFonts.nunito(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    })
              ],
            ),
          )),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.grey,
            height: 1,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'К оплате',
                      style: GoogleFonts.nunito(fontSize: 13),
                    ),
                    ValueListenableBuilder(
                        valueListenable: totalDays,
                        builder: (_, days, __) {
                          final int totalPrice = apartment.price * days;
                          return Text(
                            '$totalPrice ₸',
                            style: GoogleFonts.nunito(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          );
                        }),
                  ],
                ),
                const Spacer(),
                IntrinsicWidth(
                  child: Container(
                    key: ValueKey('pay_button'),
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.indigo,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'Оплатить',
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (userName.value.isEmpty){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UnsuccessfullyScreen(),
                                ));
                              } else {
                                final random = Random();
                                int number = 100000 + random.nextInt(900000);

                                bookingApartmentData.add(BookingData(
                                    imageUrl: apartment.imageUrl,
                                    title: apartment.title,
                                    description: apartment.description,
                                    comment: apartment.comment,
                                    address: apartment.address,
                                    rating: apartment.rating,
                                    price: apartment.price,
                                    city: apartment.city,
                                    checkInDate: checkInDate,
                                    checkOutDate: checkOutDate,
                                    bookingNumber: number,
                                  )..isNetwork = apartment.isNetwork);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SuccessScreen(),
                                ));
                              }
                            },
                            borderRadius: BorderRadius.circular(14),
                          ),
                        )
                      ],
                    ),
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
