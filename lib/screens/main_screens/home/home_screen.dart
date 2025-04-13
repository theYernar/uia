import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/database/apartment_data.dart';
import 'package:uia/database/favorites_data.dart';
import 'package:uia/screens/main_screens/apartment_details/apartment_details_screen.dart';
import 'package:uia/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _searchContoller = TextEditingController();
  List<ApartmentData> filteredApartments = [];

  @override
  void initState() {

    super.initState();
    filteredApartments = apartments.value;

    _searchContoller.addListener(() {
      final query = _searchContoller.text.toLowerCase();
      setState(() {
        filteredApartments = apartments.value.where((apartment){
          final titleMatch = apartment.title.toLowerCase().contains(query); 
          final cityMatch = apartment.city.toLowerCase().contains(query);
          return titleMatch || cityMatch;
        }).toList();
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverAppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          expandedHeight: 160.0,
          pinned: true,
          title: Image.asset('assets/icons/home.png', width: 40,),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 244, 247, 251),
          actions: [
            Icon(HugeIcons.strokeRoundedNotification02, color: AppColors.indigo,),
            const SizedBox(width: 20,),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          
          flexibleSpace: FlexibleSpaceBar(              
            background: Container(
              decoration: BoxDecoration(
                color: const Color(0xffe6eaf3), 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),

              // Search 
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18, left: 18, right: 20),
                    child: TextField(
                      controller: _searchContoller,
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: AppColors.grey),
                        hintText: 'Поиск по ЖК или городу',
                        hintStyle: GoogleFonts.nunito(
                          fontSize: 18,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: AppColors.indigo)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: AppColors.grey),             
                        ) 
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),
        ),



        // Body

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Апартаменты с идеей',
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20,),
                
                Column(
                  children: List.generate(filteredApartments.length, (index) {
                    final ApartmentData apartment = filteredApartments[index];
                    // Card
                    return Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Apartment Images
                            ApartmentImages(apartment: apartment),

                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  // Apartment name and rating
                                  Row(
                                    children: [
                                      Text(
                                        apartment.title,
                                        style: GoogleFonts.nunito(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Image.asset('assets/icons/star.png', width: 24,),
                                          const SizedBox(width: 5,),
                                          Text(
                                            '${apartment.rating}',
                                            style: GoogleFonts.nunito(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                            '(12)',
                                            style: GoogleFonts.nunito(
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.bold
                                            )
                                          )
                                        ],
                                      )
                                    ],
                                  ),

                                  // Apartment adress
                                  Text(
                                    'г. ${apartment.city}, ${apartment.address}',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    '2-х комнатная · 2 спальни · 4 кровати',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      HugeIcon(icon: HugeIcons.strokeRoundedCalendar03, color: AppColors.grey),
                                      const SizedBox(width: 5,),
                                      Text(
                                        '20 апр. - 25 апр.',
                                        style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w600
                                        ),
                                      )
                                    ],
                                  ),

                                  const SizedBox(height: 25,),
                                  
                                  Row(
                                    children: [
                                      Text(
                                        '${apartment.price} ₸',
                                        style: GoogleFonts.nunito(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' / 1 ночь',
                                        style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const Spacer(),

                                      IntrinsicWidth(
                                        child: Container(
                                          key: ValueKey('reservetion_button'),
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
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder:(context) =>
                                                          ApartmentDetailsScreen(apartment: apartment,)
                                                      )
                                                    );
                                                  },
                                                  borderRadius: BorderRadius.circular(14),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }  
                  ),
                ),
                
                
              ],
            ),
          ),
        )
      ],
      
    );
  }
}




class ApartmentImages extends StatefulWidget {
  const ApartmentImages({
    super.key,
    required this.apartment,
  });

  final ApartmentData apartment;

  @override
  State<ApartmentImages> createState() => _ApartmentImagesState();
}

class _ApartmentImagesState extends State<ApartmentImages> {

  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [

          
          PageView.builder(
            controller: _pageController,
            itemCount: widget.apartment.imageUrl.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) => widget.apartment.isNetwork ? Image.network(
              widget.apartment.imageUrl[index],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator(color: AppColors.indigo));
              },
              errorBuilder:(context, error, stackTrace) => Icon(HugeIcons.strokeRoundedRssError, size: 40,),
            
            ) : Image.file(File(widget.apartment.imageUrl[index]), fit: BoxFit.cover,),
          ),




          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: (){
                  setState(() {
                    widget.apartment.isFavorite = !widget.apartment.isFavorite;
                    if (widget.apartment.isFavorite) {
                      favorites.add(widget.apartment);
                    } else {
                      favorites.remove(widget.apartment);
                    }
                  });
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black45
                ),
                icon: widget.apartment.isFavorite ? Image.asset('assets/icons/heart.png', width: 24,): HugeIcon(icon: HugeIcons.strokeRoundedFavourite, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      widget.apartment.imageUrl.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: _currentIndex == index ? 12 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: _currentIndex == index 
                              ? Colors.white 
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}