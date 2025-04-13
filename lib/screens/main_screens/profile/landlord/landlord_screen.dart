import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uia/database/apartment_data.dart';
import 'package:uia/routes/app_routes.dart';
import 'package:uia/themes/app_colors.dart';

class LandlordScreen extends StatefulWidget {
  const LandlordScreen({super.key});

  @override
  State<LandlordScreen> createState() => _LandlordScreenState();
}

class _LandlordScreenState extends State<LandlordScreen> {
  
  final ImagePicker _picker = ImagePicker();
  List<String> apartmentImagesList = [];

  Future<void> pickImage() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    

    if (_image != null) {
      setState(() {
        apartmentImagesList.add(_image.path);
      });
    }
  }

  bool isEnabled = false;


  TextEditingController titleController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceContoller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context),
          icon: Icon(HugeIcons.strokeRoundedArrowLeft01)),
          title: Text(
            'Создать объявление',
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),
          ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                       
                        Row(
                          children: List.generate(
                            apartmentImagesList.length, (index) => Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.file(
                                      File(apartmentImagesList[index]), 
                                      fit: BoxFit.cover, height: 150, width: 150,
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            apartmentImagesList.remove(apartmentImagesList[index]);
                                          });
                                        }, icon: HugeIcon(
                                          icon: HugeIcons.strokeRoundedCancel01, 
                                          color: Colors.black
                                        )
                                      )
                                    )
                                  ],
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ), 
                          ),
                        ),
                        
                        // const SizedBox(width: 20,),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: AppColors.buttonBackgroundColor,
                                borderRadius: BorderRadius.circular(35)
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        HugeIcon(icon: HugeIcons.strokeRoundedCamera01, color: AppColors.grey, size: 40,),
                                        const SizedBox(height: 5,),
                                        Text(
                                          'Загрузить', 
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w500,
                                            // color: AppColors.grey
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: pickImage,
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  )
                                ],
                              ) ,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),



                  const SizedBox(height: 20,),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Заголовок',
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ), 
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      labelText: 'Комментарий',
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ), 
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Описание',
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ), 
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: 'Город',
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ), 
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Адрес',
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ), 
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: priceContoller,
                    onChanged: (value) {
                      setState(() {
                        if (apartmentImagesList.isNotEmpty && titleController.text.isNotEmpty && commentController.text.isNotEmpty && descriptionController.text.isNotEmpty && cityController.text.isNotEmpty && addressController.text.isNotEmpty && priceContoller.text.isNotEmpty  ) {
                          isEnabled = true;
                        } else {
                          isEnabled = false;
                        }
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Цена',
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)
                      ), 
                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isEnabled ? AppColors.indigo : AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(14),
                // border: Border.all(width: 2, color: AppColors.indigo)
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Создать',
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

                        final newApartment = 
                          ApartmentData(
                            imageUrl: apartmentImagesList,
                            title: titleController.text, 
                            description: descriptionController.text, 
                            comment: commentController.text, 
                            city: cityController.text, 
                            address: addressController.text, 
                            rating: 4.9, 
                            price: int.parse(priceContoller.text),
                            isNetwork: false,
                          );

                        apartments.value.add(newApartment);
                        Navigator.of(context).pushNamed(AppRoutes.mainScreens);
                      },
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ) : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
