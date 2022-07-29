import 'package:aplikasi_resto/controller/transaction.dart';
import 'package:aplikasi_resto/genosLib/component/page/genPage.dart';
import 'package:aplikasi_resto/helper/page-loading.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/genText.dart';

class PesananPage extends StatefulWidget {
  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  List<dynamic> _items = [];
  bool isLoading = true;
  String _status = "menunggu";

  @override
  void initState() {
    // TODO: implement initState
    getListTransaction();
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
                            "Pesanan",
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
        height: double.infinity,
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 50,
            child: CustomRadioButton(
              elevation: 0,
              absoluteZeroSpacing: true,
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: ["Menunggu", "Proses", "Selesai"],
              buttonValues: ["menunggu", "proses", "selesai"],
              defaultSelected: "menunggu",
              buttonTextStyle: ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(fontSize: 16)),
              radioButtonValue: (value) {
                setState(() {
                  _status = value.toString();
                });
                getListTransaction();
              },
              selectedColor: Theme.of(context).accentColor,
              enableShape: true,
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          isLoading
              ? Expanded(child: PageLoading())
              : Expanded(
                  child: RefreshIndicator(
                  onRefresh: () {
                    return refresh();
                  },
                  child: LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: _items.length <= 0
                          ? Container(
                              height: 200,
                              child: Center(
                                child: Text("Belum ada transaksi..."),
                              ),
                            )
                          : Column(
                              children: _items
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "detail-pesanan",
                                                arguments: e['id'].toString());
                                          },
                                          child: Container(
                                            height: 120,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(bottom: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.blue,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e['no_transaksi'].toString(),
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "IDR " +
                                                                e['total']
                                                                    .toString()
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 30,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .blue),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              e['status']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList()),
                    );
                  }),
                ))
        ]),
      ),
    );
  }

  refresh() async {
    getListTransaction();
  }

  void getListTransaction() async {
    setState(() {
      isLoading = true;
    });
    List<dynamic> _data = await listTransaction(_status);
    setState(() {
      _items = _data;
      isLoading = false;
    });
  }
}
