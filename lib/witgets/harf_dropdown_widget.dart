// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:not_ortalama_hesaplama/helper/helper_data.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onBuildHarf;
  HarfDropdownWidget({required this.onBuildHarf, Key? key}) : super(key: key);

  @override
  _HarfDropdownWidgetState createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarf = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade100.withOpacity(0.3),
            borderRadius: Sabitler.borderRadius),
        padding: Sabitler.dropDownPadding,
        child: DropdownButton<double>(
            iconEnabledColor: Sabitler.anaRenk.shade200,
            elevation: 16,
            borderRadius: Sabitler.borderRadius,
            onChanged: (deger) {
              setState(() {
                secilenHarf = deger!;
                widget.onBuildHarf(secilenHarf);
              });
            },
            value: secilenHarf,
            items: DataHelper.dersHarfleriniGoster()));
  }
}
