import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:not_ortalama_hesaplama/helper/helper_data.dart';
import 'package:not_ortalama_hesaplama/model/class.dart';
import 'package:not_ortalama_hesaplama/witgets/harf_dropdown_widget.dart';
import 'package:not_ortalama_hesaplama/witgets/kredi_dropdown_widget.dart';
import 'package:not_ortalama_hesaplama/witgets/show_avarage.dart';
import 'package:not_ortalama_hesaplama/witgets/show_class_in_list.dart';

class OrtalamaHesaplamaMainPage extends StatefulWidget {
  const OrtalamaHesaplamaMainPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplamaMainPageState createState() =>
      _OrtalamaHesaplamaMainPageState();
}

class _OrtalamaHesaplamaMainPageState extends State<OrtalamaHesaplamaMainPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarf = 4;
  int secilenKredi = 1;
  String girilenDers = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
              child: Text(Sabitler.baslikText, style: Sabitler.baslikStyle)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: _buildForm()),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                    dersSayisi: DataHelper.dersListesi.length,
                    ortalama: DataHelper.ortalamaHesapla(),
                  ),
                )
              ],
            ),
            Expanded(
              child: DersleriListedeGoster(
                onListeSilme: (index) {
                  DataHelper.dersListesi.removeAt(index);
                  setState(() {});
                  debugPrint(DataHelper.dersListesi.toString());
                },
              ),
            )
          ],
        ));
  }

  Form _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: HarfDropdownWidget(
                    onBuildHarf: (harf) {
                      secilenHarf = harf;
                    },
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(child: KrediDropdownWidget(
                    onBuildKredi: (kredi) {
                      secilenKredi = kredi;
                    },
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: IconButton(
                    onPressed: _dersEkleVeOrtalamaHesapla,
                    icon: const Icon(Icons.arrow_forward_ios_sharp),
                    color: Sabitler.anaRenk,
                    iconSize: 30,
                  ))
                ],
              ),
            )
          ],
        ));
  }

  _buildTextFormField() {
    return TextFormField(
      validator: (s) {
        if (s!.isEmpty) {
          return "lutfen bir ders giriniz";
        } else {
          null;
        }
      },
      onSaved: (deger) {
        setState(() {
          girilenDers = deger!;
        });
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
          hintText: "Ders adi",
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: Sabitler.borderRadius)),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDers, krediDegeri: secilenKredi, harfDegeri: secilenHarf);
      DataHelper.dersleriListeyeEkle(eklenecekDers);
    }
    setState(() {});
  }
}
