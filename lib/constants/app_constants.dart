import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesaplama";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);
  static const borderRadius = BorderRadius.all(Radius.circular(20));
  static final TextStyle dersSayisiTextStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);
  static final TextStyle ortalamaTextStyle = GoogleFonts.quicksand(
      fontSize: 54, fontWeight: FontWeight.w800, color: anaRenk);
  static const dropDownPadding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);
}
