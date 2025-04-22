import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


ValueNotifier<XFile?> userAvatar = ValueNotifier<XFile?>(null);
ValueNotifier<String> userName = ValueNotifier<String>('');
ValueNotifier<String> userPhoneNumber = ValueNotifier<String>('');
