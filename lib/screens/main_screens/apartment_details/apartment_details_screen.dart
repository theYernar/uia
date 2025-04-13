import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:uia/database/apartment_data.dart';
import 'package:uia/database/favorites_data.dart';
import 'package:uia/screens/main_screens/apartment_details/confirm_booking/confirm_booking_screen.dart';
import 'package:uia/themes/app_colors.dart';
import 'widgets/apartment_image_widget.dart';



// ValueNotifier<DateTime?> checkInDate = ValueNotifier(null);
// ValueNotifier<DateTime?> checkOutDate = ValueNotifier(null);

ValueNotifier<DateTime?> checkInDate = ValueNotifier(DateTime.now());
ValueNotifier<DateTime?> checkOutDate = ValueNotifier(DateTime.now().add(Duration(days: 1)));

ValueNotifier<int> totalDays = ValueNotifier(1);

class ApartmentDetailsScreen extends StatefulWidget {
  
  final ApartmentData apartment;
  const ApartmentDetailsScreen({super.key, required this.apartment});

  @override
  State<ApartmentDetailsScreen> createState() => _ApartmentDetailsScreenState();
}

class _ApartmentDetailsScreenState extends State<ApartmentDetailsScreen> {
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
                    widget.apartment.isFavorite = !widget.apartment.isFavorite;
                    if (widget.apartment.isFavorite){
                      favorites.add(widget.apartment);
                    } else {
                      favorites.remove(widget.apartment);
                    }
                  });
                }, 
                icon: widget.apartment.isFavorite ? Image.asset('assets/icons/heart.png', width: 24,): Icon(HugeIcons.strokeRoundedFavourite,), 
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color.fromARGB(140, 0, 0, 0)
                  )
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ApartmentImage(apartment: widget.apartment),
            ),
          ),
      
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  // Apartment name, address and rating
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.apartment.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'г. ${widget.apartment.city}, ${widget.apartment.address}',
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
                                '${widget.apartment.rating}',
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

                  // Description
                  const SizedBox(height: 15,),
                  Text(
                    '${widget.apartment.description}',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                    ),
                  ),
                  
                  // -------------------------
                  const SizedBox(height: 20,),

                  Row(
                    children: [
                      Text(
                        'Удобства',
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: (){}, 
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Смотреть все',
                              style: GoogleFonts.nunito(
                                color: AppColors.green,
                                fontSize: 16
                              )
                            ),
                            const SizedBox(width: 10,),
                            Icon(HugeIcons.strokeRoundedArrowRight01, color: AppColors.green,)
                          ],
                        )
                      )
                    ],
                  ),

                  // --------------------------------------------
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 230,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.9,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.buttonBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedWifi02,
                              color: AppColors.green,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Wi-Fi',
                            style: GoogleFonts.nunito( ),
                          ),
                        ],
                      ),
                    ),
                  ),

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
                        'г. ${widget.apartment.city}, ${widget.apartment.address}',
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

                  
                  _DateSelectWidget(),
                  const SizedBox(height: 50,),

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: totalDays,
                  builder: (_, days,__) {
                    final int totalPrice = widget.apartment.price * days;
                    return Text(
                      '$totalPrice ₸',
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: totalDays,
                  builder:(context, value, child) {
                    return Text(
                      ' / $value ночь',
                      style: GoogleFonts.nunito(
                        color: AppColors.grey,
                        fontSize: 16
                      ),
                    );
                  }
                ),
                const Spacer(),
                IntrinsicWidth(
                  child: Container(
                    key: ValueKey('booking_button'),
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
                              'Забронировать',
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
                              if (checkInDate.value != null && checkOutDate.value != null){
                                Navigator.of(context).push(
                                  MaterialPageRoute( 
                                    builder: (context) =>
                                       ConfirmBookingScreen(
                                        apartment: widget.apartment, 
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
                )
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
  const _DateSelectWidget();

  @override
  State<_DateSelectWidget> createState() => _DateSelectWidgetState();
}

class _DateSelectWidgetState extends State<_DateSelectWidget> {

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context, int index) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context, 
      firstDate: DateTime(DateTime.now().year), 
      lastDate: DateTime(2026),
    );


    if (pickedDate == null) return;

    setState(() {
      if (index == 0){
        checkInDate.value = pickedDate;

        if (checkOutDate.value != null &&
          (checkOutDate.value!.isBefore(checkInDate.value!) ||
              checkOutDate.value!.isAtSameMomentAs(checkInDate.value!))) {
        checkOutDate.value = checkInDate.value!.add(const Duration(days: 1));
      }
      } else {
        checkOutDate.value = pickedDate;

        if (checkInDate.value != null &&
          (checkOutDate.value!.isBefore(checkInDate.value!) ||
              checkOutDate.value!.isAtSameMomentAs(checkInDate.value!))) {
        checkOutDate.value = checkInDate.value!.add(const Duration(days: 1));
      }
      }
    });


    if (checkInDate.value != null && checkOutDate.value != null){
      totalDays.value = checkOutDate.value!.difference(checkInDate.value!).inDays;

    }

  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _selectDate(context, 0),
            child: Container(
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
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: InkWell(
            onTap: () => _selectDate(context, 1),
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(15)
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
                   checkOutDate.value == null
                    ? 'Выберите дату' : DateFormat('d MMMM', 'ru').format(checkOutDate.value!),
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
