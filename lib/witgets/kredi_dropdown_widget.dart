import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:not_ortalama_hesaplama/helper/helper_data.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onBuildKredi;
  KrediDropdownWidget({required this.onBuildKredi, Key? key}) : super(key: key);

  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  int secilenKredi = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade100.withOpacity(0.3),
            borderRadius: Sabitler.borderRadius),
        padding: Sabitler.dropDownPadding,
        child: DropdownButton<int>(
            iconEnabledColor: Sabitler.anaRenk.shade200,
            elevation: 16,
            borderRadius: Sabitler.borderRadius,
            onChanged: (deger) {
              setState(() {
                secilenKredi = deger!;
                widget.onBuildKredi(secilenKredi);
              });
            },
            value: secilenKredi,
            items: DataHelper.dersKredileriniGoster()));
  }
}
