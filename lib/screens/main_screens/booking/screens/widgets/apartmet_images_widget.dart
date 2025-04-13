
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uia/database/apartment_data.dart';
import 'package:uia/themes/app_colors.dart';

class ApartmentImagesWidget extends StatefulWidget {
  const ApartmentImagesWidget({
    super.key,
    required this.apartment,
  });

  final ApartmentData apartment;

  @override
  State<ApartmentImagesWidget> createState() => _ApartmentImagesWidgetState();
}

class _ApartmentImagesWidgetState extends State<ApartmentImagesWidget> {
  // bool get isFavorite => favorites.contains(widget.apartment);

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
            itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: widget.apartment.isNetwork ? Image.network(
                widget.apartment.imageUrl[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: AppColors.indigo));
                },
                errorBuilder:(context, error, stackTrace) => Icon(HugeIcons.strokeRoundedRssError, size: 40,),

              ) : Image.file(File(widget.apartment.imageUrl[index]), fit: BoxFit.cover,),
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