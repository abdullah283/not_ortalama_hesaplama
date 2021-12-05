import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/model/class.dart';

class DataHelper {
  static List<String> dersHarfleriListe() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static harfinDoubleKarsiligi<double>(String gelenHarf) {
    switch (gelenHarf) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;

      default:
        1.0;
    }
  }

  static List<DropdownMenuItem<double>> dersHarfleriniGoster() {
    return dersHarfleriListe()
        .map((e) => DropdownMenuItem<double>(
              child: Text(e),
              value: harfinDoubleKarsiligi(e),
            ))
        .toList();
  }

  static List<int> dersKredileriListe() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> dersKredileriniGoster() {
    return dersKredileriListe()
        .map((e) => DropdownMenuItem<int>(
              child: Text(e.toString()),
              value: e,
            ))
        .toList();
  }

  static List<Ders> dersListesi = [];
  static dersleriListeyeEkle(Ders ders) {
    dersListesi.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamKredi = 0;
    double ortalama = 0;
    for (var element in dersListesi) {
      toplamKredi = toplamKredi + element.krediDegeri;
      ortalama = ortalama + (element.harfDegeri * element.krediDegeri);
    }
    if (toplamKredi == 0) return 0.0;
    return ortalama / toplamKredi;
  }
}
