import 'package:ecommerc_app_b2g_test/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/home/home_page.dart';
import 'variables/variables.dart';

void main() {
  // Variables.statusBarTheme;
  // Variables.portraitMood;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ProductController pc = Get.put<ProductController>(ProductController());
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'E-Commerce App',
            debugShowCheckedModeBanner: false,
            theme: Variables.themeData,
            home: HomePage(),
            builder: (context, child) {
              child = MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child!);
              return child;
            },
          );
        });
  }
}
