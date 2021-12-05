// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/helper/helper_data.dart';

class DersleriListedeGoster extends StatefulWidget {
  final Function onListeSilme;
  DersleriListedeGoster({required this.onListeSilme, Key? key})
      : super(key: key);

  @override
  _DersleriListedeGosterState createState() => _DersleriListedeGosterState();
}

class _DersleriListedeGosterState extends State<DersleriListedeGoster> {
  @override
  Widget build(BuildContext context) {
    List tumDersler = DataHelper.dersListesi;
    return ListView.builder(
        itemCount: tumDersler.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              onDismissed: (e) {
                setState(() {
                  widget.onListeSilme(index);
                });
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        child: Text(
                          ((tumDersler[index].krediDegeri *
                                      tumDersler[index].harfDegeri)
                                  .toDouble())
                              .toString(),
                        ),
                      ),
                      subtitle: Text(
                          "ders kredisi:${tumDersler[index].krediDegeri} ders notu:${tumDersler[index].harfDegeri}")),
                ),
              ));
        });
  }
}
