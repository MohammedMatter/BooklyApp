import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/presentation/views/home_page_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme(backgroundColor: kPrimaryColor),
      ),
      initialRoute: 'SplashView',
      routes: {
        'HomePage': (context) => HomePage(),
        'SplashView': (context) => SplashView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
