import 'package:aplikasi_resto/genosLib/component/button/genButton.dart';
import 'package:aplikasi_resto/genosLib/component/radiobutton/genRadioMini.dart';
import 'package:aplikasi_resto/genosLib/component/textfiled/TextField.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genRow.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return GenPage(
      appbar: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                            child: Icon(
                          Icons.chevron_left,
                          size: 30,
                        ))),
                  ),
                  Container(
                      // height: 80,
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: GenText(
                            "Keranjang Pesanan",
                            style: TextStyle(fontSize: 20),
                          ))),
                  // GenText(
                  //   "QR Code",
                  //   style: TextStyle(color: Colors.black87, fontSize: 35),
                  // )
                ]),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      badges: "5",
                    ),
                    GenCardArtikel(
                      ontap: () {
                        Navigator.pushNamed(context, "detail");
                      },
                      judul: "Nasi Goreng Sea Food",
                      isi: "Nasi goreng dengan potongan Udang besar",
                      harga: "Rp 25.000",
                      badges: "1",
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
                      badges: "2",
                      gambar:
                          "https://img.okezone.com/content/2022/06/06/298/2606641/segini-kalori-mie-goreng-kesukaan-kamu-jangan-kaget-ya-kltyXigXMx.jpg",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GenText("Total Pembayaran"),
                  GenText(
                    "Rp 50.000",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenButtonOutline(
                    text: "Pesan Makanan Lagi",
                    ontap: () {
                      Navigator.pushNamed(context, "home");
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenButton(
                    text: "Proses Masakan",
                    ontap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
