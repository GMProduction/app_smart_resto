import 'dart:developer';

import 'package:aplikasi_resto/controller/transaction.dart';
import 'package:aplikasi_resto/genosLib/component/page/genPage.dart';
import 'package:flutter/material.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/genText.dart';
import '../helper/static_variable.dart';

class DetailPesananPage extends StatefulWidget {
  @override
  _DetailPesananPageState createState() => _DetailPesananPageState();
}

class _DetailPesananPageState extends State<DetailPesananPage> {
  Map<String, dynamic> _dataItem = {};
  List<dynamic> _items = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String id = ModalRoute.of(context)!.settings.arguments as String;
      log("Argument Value " + id);
      _getTransactionById(id);
      // _getMenuById(id);
    });
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
                            "Detail Pesanan",
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
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Detail Pesanan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "No. Transaksi : ${_dataItem['no_transaksi'].toString()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Status : ${_dataItem['status'].toString()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Data Pesanan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _items
                      .map((e) => GenCardArtikel(
                            judul: e['item']['nama'].toString(),
                            isi: e['item']['deskripsi'].toString(),
                            harga: "Rp ${e['harga'].toString()}",
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
                    "Rp ${_dataItem['total'].toString()}",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getTransactionById(String id) async {
    Map<String, dynamic> _data = await getTransactionById(id);
    List<dynamic> tmpItems = _data['cart'] as List;
    setState(() {
      _dataItem = _data;
      _items = tmpItems;
    });
    log(_data.toString());
  }

  refresh() async {
    _getTransactionById("id");
  }
}
