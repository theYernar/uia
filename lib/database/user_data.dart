import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


ValueNotifier<XFile?> userAvatar = ValueNotifier<XFile?>(null);
ValueNotifier<String> userName = ValueNotifier<String>('');
ValueNotifier<String> userPhoneNumber = ValueNotifier<String>('');

// class UserData {
//   XFile? image;
//   String name;
//   String phoneNumber;

//   UserData({required this.name, required this.phoneNumber});

//   void setAvatar(XFile? avatar){
//     image = avatar;
//   }

//   void setName(String setName){
//     name = setName;
//   }

//   void setPhone(String number){
//     phoneNumber = number;
//   }
// }
