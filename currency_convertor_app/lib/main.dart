import 'package:currency_convertor_app/Commen/app_colors.dart';
import 'package:currency_convertor_app/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Converter',
        theme: ThemeData(
          fontFamily: 'DMSans',
          primaryColor:AppColors.primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView());
  }
}