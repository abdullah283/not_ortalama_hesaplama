import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:not_ortalama_hesaplama/witgets/avarage_calculation_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ORTALAMA HESAPLAMA',
        theme: ThemeData(
            primarySwatch: Sabitler.anaRenk,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const OrtalamaHesaplamaMainPage());
  }
}
