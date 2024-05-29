import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/1_Pages/SplacScreen.dart';
import 'package:hine/langug/langug.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String l = "ar";
    return GetMaterialApp(
      translations: translation(),
      locale: Locale(l), //Get.deviceLocale,//لغه علئ حسب لغه الجهاز
      fallbackLocale: Locale(l), // in error
      home: Splach(),
    );
  }
}
