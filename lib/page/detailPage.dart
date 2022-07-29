import 'dart:developer';

import 'package:aplikasi_resto/controller/cart.dart';
import 'package:aplikasi_resto/controller/items.dart';
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

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic> _dataItem = {};
  int _qty = 1;
  String _deskripsi = '';
  String _itemId = "0";
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String id = ModalRoute.of(context)!.settings.arguments as String;
      log("Argument Value " + id);
      _getMenuById(id);
    });
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
                            "Detail Makanan",
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
                    Image.network(
                        "$BaseHostImage${_dataItem['gambar'].toString()}",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover),
                    Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenText(
                              _dataItem['nama'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 24),
                            ),
                            GenText(
                              "Rp ${_dataItem['harga'].toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GenText(
                              _dataItem['deskripsi'].toString(),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    _deskripsi = text;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "Catatan"),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    child: SpinBox(
                      min: 1,
                      max: 100,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          _qty = value.toInt();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenButton(
                    text: "Tambah di keranjang",
                    ontap: () {
                      _addToCart(context);
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

  void _getMenuById(String id) async {
    Map<String, dynamic> _data = await getMenuById(id);
    setState(() {
      _dataItem = _data;
      _itemId = id;
    });
    log(_data.toString());
  }

  void _addToCart(BuildContext context) async {
    Map<String, dynamic> _data = {
      "item_id": _itemId,
      "qty": _qty,
      "deskripsi": _deskripsi
    };
    await addToCart(_data, context);
  }
}
