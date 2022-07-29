import 'package:aplikasi_resto/controller/cart.dart';
import 'package:aplikasi_resto/genosLib/component/button/genButton.dart';
import 'package:aplikasi_resto/genosLib/component/radiobutton/genRadioMini.dart';
import 'package:aplikasi_resto/genosLib/component/textfiled/TextField.dart';
import 'package:aplikasi_resto/helper/static_variable.dart';
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
  List<dynamic> _list = [];
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    _getListCart();
    super.initState();
  }

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
                  children: _list
                      .map((e) => GenCardArtikel(
                            ontap: () {
                              Navigator.pushNamed(context, "detail");
                            },
                            judul: e['item']['nama'].toString(),
                            isi: e['item']['deskripsi'].toString(),
                            harga: "Rp ${e['total'].toString()}",
                            gambar:
                                "$BaseHostImage${e['item']['gambar'].toString()}",
                            badges: e['qty'].toString(),
                          ))
                      .toList(),
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
                    "Rp ${total.toString()}",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenButton(
                    text: "Checkout",
                    ontap: () {
                      checkout(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getListCart() async {
    List<dynamic> _data = await listAvailableCart();
    setState(() {
      _list = _data;
    });

    _data.forEach((element) {
      int _price = element['total'] as int;
      setState(() {
        total += _price;
      });
    });
  }
}
