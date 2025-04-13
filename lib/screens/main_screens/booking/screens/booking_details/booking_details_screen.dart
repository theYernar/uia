import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:uia/database/booking_data.dart';
import 'package:uia/database/favorites_data.dart';
import 'package:uia/screens/main_screens/apartment_details/confirm_booking/confirm_booking_screen.dart';
import 'package:uia/screens/main_screens/booking/screens/extend_booking/extend_booking.dart';
import 'package:uia/themes/app_colors.dart';
import 'widgets/apartment_image_widget.dart';



ValueNotifier<DateTime?> checkInDate = ValueNotifier(null);
ValueNotifier<DateTime?> checkOutDate = ValueNotifier(null);
ValueNotifier<int> totalDays = ValueNotifier(1);


class BookingDetailsScreen extends StatefulWidget {
  
  final BookingData booking;
  const BookingDetailsScreen({super.key, required this.booking});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 280,

            title: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context), 
                  icon: Icon(HugeIcons.strokeRoundedArrowLeft01), color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color.fromARGB(140, 0, 0, 0)
                  )
                ),
                const Spacer(),
                IconButton(onPressed: () {
                  setState(() {
                    widget.booking.isFavorite = !widget.booking.isFavorite;
                    if (widget.booking.isFavorite){
                      favorites.add(widget.booking);
                    } else {
                      favorites.remove(widget.booking);
                    }
                  });
                }, 
                icon: widget.booking.isFavorite ? Image.asset('assets/icons/heart.png', width: 24,): Icon(HugeIcons.strokeRoundedFavourite,), 
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color.fromARGB(140, 0, 0, 0)
                  )
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ApartmentImage(apartment: widget.booking),
            ),
          ),
      
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      Text(
                        'Номер брони #${widget.booking.bookingNumber}',
                        style: GoogleFonts.nunito(
                          color: AppColors.grey,
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                  // Apartment name, address and rating
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.booking.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'г. ${widget.booking.city}, ${widget.booking.address}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/star.png', width: 20,),
                              const SizedBox(width: 5,),
                              Text(
                                '${widget.booking.rating}',
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '[12 отзывов]',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunito(
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold
                          )
                          )
                        ],
                      )
                    ],
                  ),

                  // -----------------------------------------------
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            '2 комнатная',
                            style: GoogleFonts.nunito( ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // -------------------------
                  const SizedBox(height: 20,),

                  // Location
                  Text(
                    'Локация',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.strokeRoundedLocation01, color: AppColors.green),
                      const SizedBox(width: 5,),
                      Text(
                        'г. ${widget.booking.city}, ${widget.booking.address}',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  // Booking date
                  const SizedBox(height: 30,),
                  Text(
                    'Дата бронирование',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20,),

                  
                  _DateSelectWidget(booking: widget.booking,),
                  const SizedBox(height: 20,),
                  Divider(color: AppColors.buttonBackgroundColor,),
                  const SizedBox(height: 10,),
                
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
                      final int totalPrice = widget.booking.price * days;
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.booking.price} ₸ x $days ночей',
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
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(color: AppColors.grey, height: 1, width: double.infinity,),
          
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Отменить бронь',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: AppColors.grey,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            if (checkInDate.value != null && checkOutDate.value != null){
                              Navigator.of(context).push(
                                MaterialPageRoute( 
                                  builder: (context) =>
                                     ConfirmBookingScreen(
                                      apartment: widget.booking, 
                                      checkInDate: checkInDate.value, 
                                      checkOutDate: checkOutDate.value,
                                      totalDays: totalDays, 
                                    ),
                                  
                                )
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(14),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  key: ValueKey('extend_booking_button'),
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
                            'Продлить бронь',
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
                              MaterialPageRoute(builder:(context) => ExtendBooking(),)
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
        ],
      ),
    );
  }
}

// ====================Date Select Widget==================== //

class _DateSelectWidget extends StatefulWidget {
  final BookingData booking;
  const _DateSelectWidget({required this.booking});

  @override
  State<_DateSelectWidget> createState() => _DateSelectWidgetState();
}

class _DateSelectWidgetState extends State<_DateSelectWidget> {

  // DateTime? initialDate = DateTime.now();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 0.5),
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
                  widget.booking.checkInDate == null ? 'Выберите дату' : DateFormat('d MMMM', 'ru').format(widget.booking.checkInDate!),
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Дата выезда',
                  style: GoogleFonts.nunito(
                    color: AppColors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                 widget.booking.checkOutDate == null
                  ? 'Выберите дату' : DateFormat('d MMMM', 'ru').format(widget.booking.checkOutDate!),
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
