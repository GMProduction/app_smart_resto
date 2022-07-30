import 'package:aplikasi_resto/genosLib/component/badges/badges.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../genText.dart';
import '../etc/genDimen.dart';
import '../etc/genRow.dart';
import '../etc/genShadow.dart';

class GenCard extends StatelessWidget {
  final double radius;
  final double? shadowRadius;
  final double? height;
  final double width;
  final Color backGroundColor;
  final Color? shadowColor;
  final double? shadowOffset;
  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function()? ontap;

  GenCard(
      {this.ontap,
      this.radius = 10,
      this.height = double.infinity - 20,
      this.shadowRadius,
      this.width = 250,
      this.backGroundColor = Colors.white,
      this.shadowColor,
      this.shadowOffset,
      this.child,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap == null ? () {} : ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backGroundColor,
            boxShadow: GenShadow()
                .genShadow(color: shadowColor, radius: shadowRadius)),
        margin: margin,
        padding: padding,
        width: width,
        child: child,
      ),
    );
  }
}

class GenCardVertical extends StatelessWidget {
  final String gambar;
  final String judul;
  final String kota;
  final String tanggal;
  final Function ontap;

  GenCardVertical(
    this.ontap, {
    this.gambar =
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    this.judul = "-",
    this.kota = "-",
    this.tanggal = "-",
  });

  @override
  Widget build(BuildContext context) {
    return GenCard(
        ontap: () {},
        margin: EdgeInsets.only(
            left: GenDimen.cardMargin, right: GenDimen.cardMargin, bottom: 5),
        width: 180,
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              gambar,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenText(judul,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  RowSpaceBetween(
                      paddingHorz: 0,
                      chilidLeft: GenText(kota,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 10)),
                      childRight: GenText(tanggal,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 10))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ]));
  }
}

class GenCardArtikel extends StatelessWidget {
  final String gambar;
  final String judul;
  final String isi;
  final String harga;
  final Function()? ontap;
  final String? badges;

  GenCardArtikel({
    this.ontap,
    this.gambar =
        "https://bodybigsize.com/wp-content/uploads/2020/02/noimage-8.png",
    this.judul = "-",
    this.isi = "-",
    this.harga = "-",
    this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return GenCard(
      ontap: ontap ?? () {},
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          horizontal: GenDimen.cardMargin, vertical: GenDimen.cardMargin),
      child: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                gambar,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: GenDimen.afterTitle,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                        ),
                        Row(
                          children: [
                            GenText(judul,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(
                              width: 5,
                            ),
                            badges == null
                                ? Container()
                                : Badgesred(
                                    text: badges.toString(),
                                  )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        GenText(isi,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                    GenText(harga,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
