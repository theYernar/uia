import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/database/apartment_data.dart';
import 'package:uia/database/favorites_data.dart';
import 'package:uia/database/user_data.dart';
import 'package:uia/screens/main_screens/apartment_details/apartment_details_screen.dart';
import 'package:uia/screens/main_screens/home/home_screen.dart';
import 'package:uia/screens/sign_up/enter_phone_number_screen.dart';
import 'package:uia/themes/app_colors.dart';

import 'pages/no_favorites.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      if (userName.value.isEmpty && !_isRedirecting){
        _isRedirecting = true;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder:(context) => EnterPhoneNumberScreen()),
          (route) => false
        );
      } 
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Избранные',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.w600
          ),
        ),
      ),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: 
          favorites.isEmpty ? NoFavoritesPage() :
          Column(
            children: List.generate(favorites.length, (index) {
              final ApartmentData apartment = favorites[index];
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
                              'г. Алматы, ${apartment.address}',
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
        ),
      )
    );
  }
}