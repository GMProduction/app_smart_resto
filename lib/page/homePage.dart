import 'package:aplikasi_resto/genosLib/component/radiobutton/genRadioMini.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genRow.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GenPage(
      appbar: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            "assets/icons/menu_icon.png",
                            color: Colors.black87,
                          )))),
              Container(
                  width: 80,
                  height: 80,
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            child: Image.network(
                                "https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_account_circle_48px-512.png"),
                            backgroundColor: Colors.transparent,
                          )))),
              // GenText(
              //   "QR Code",
              //   style: TextStyle(color: Colors.black87, fontSize: 35),
              // )
            ]),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: CustomRadioButton(
                      elevation: 0,
                      absoluteZeroSpacing: true,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        'Makanan',
                        'Minuman',
                        'Snack',
                      ],
                      buttonValues: [
                        "Makanan",
                        "Minuman",
                        "Snack",
                      ],
                      defaultSelected: "Makanan",
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                      selectedColor: Theme.of(context).accentColor,
                      enableShape: true,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    // GenRadioGroupMiniInString(listData: data,
                    //   id: "id",
                    //   title: "title",
                    //   ontap: (){},
                    //
                    // )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RowSpaceBetween(
                    chilidLeft: GenText(
                      "Makanan yang Tersedia",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    childRight: InkWell(
                        onTap: () {
                          //PINDAH KE HALAMAN LIHAT SEMUA ARTIKEL
                        },
                        child: GenText(
                          "",
                          style: TextStyle(color: GenColor.primaryColor),
                        )),
                  ),
                  SizedBox(
                    height: GenDimen.afterTitle,
                  ),
                  Column(
                    children: [
                      GenCardArtikel(
                        ontap: () {
                          Navigator.pushNamed(context, "detail");
                        },
                        judul: "Nasi Goreng Sosis",
                        isi: "Nasi goreng dengan potongan sosis besar",
                        harga: "Rp 20.000",
                        gambar:
                            "https://sweetrip.id/wp-content/uploads/2021/11/resep-nasi-goreng-setan.jpg",
                      ),
                      GenCardArtikel(
                        ontap: () {
                          Navigator.pushNamed(context, "detail");
                        },
                        judul: "Nasi Goreng Sea Food",
                        isi: "Nasi goreng dengan potongan Udang besar",
                        harga: "Rp 25.000",
                        gambar:
                            "https://cdn0-production-images-kly.akamaized.net/xDdS1k6neUXJAM802YbCU8HOZgE=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4018264/original/019930600_1652166761-american-shrimp-fried-rice-served-with-chili-fish-sauce-thai-food__1_.jpg",
                      ),
                      GenCardArtikel(
                        ontap: () {
                          Navigator.pushNamed(context, "detail");
                        },
                        judul: "Mie Goreng Spesial",
                        isi: "Mie goreng dengan potongan Udang besar",
                        harga: "Rp 15.000",
                        gambar:
                            "https://img.okezone.com/content/2022/06/06/298/2606641/segini-kalori-mie-goreng-kesukaan-kamu-jangan-kaget-ya-kltyXigXMx.jpg",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              child: SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
                  animatedIconTheme: IconThemeData(size: 22),
                  backgroundColor: Colors.orange,
                  visible: true,
                  curve: Curves.bounceIn,
                  children: [
                    // FAB 1
                    SpeedDialChild(
                        child: Icon(Icons.chat),
                        backgroundColor: Colors.green,
                        onTap: () {
                          /* do anything */
                          Navigator.pushNamed(context, "chat");
                        },
                        label: 'Chat',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16.0),
                        labelBackgroundColor: Colors.green),
                    // FAB 2
                    SpeedDialChild(
                        child: Icon(Icons.shopping_cart),
                        backgroundColor: Colors.orange,
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "keranjang");
                          });
                        },
                        label: 'Keranjang',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16.0),
                        labelBackgroundColor: Colors.orange)
                  ]),
            ),
          )
        ],
      ),
      // floatingActionButton:

      // FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //     Navigator.pushNamed(context, "keranjang");
      //   },
      //   backgroundColor: Colors.orange,
      //   child: const Icon(Icons.shopping_cart),
      // ),
    );
  }
}
