import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster(
      {required this.dersSayisi,required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi ders girildi" : "ders girilmedi",
          style: Sabitler.dersSayisiTextStyle,
        ),
        Text(ortalama.toStringAsFixed(2), style: Sabitler.ortalamaTextStyle),
        Text(
          "Ortalama",
          style: Sabitler.dersSayisiTextStyle,
        )
      ],
    );
  }
}
