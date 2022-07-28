import 'dart:developer';

import 'package:aplikasi_resto/controller/categories.dart';
import 'package:aplikasi_resto/controller/items.dart';
import 'package:aplikasi_resto/genosLib/component/radiobutton/genRadioMini.dart';
import 'package:aplikasi_resto/helper/page-loading.dart';
import 'package:aplikasi_resto/helper/static_variable.dart';
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
  List<dynamic> _categories = [];
  List<dynamic> _items = [];
  bool isLoading = true;
  bool isLoadingItem = true;
  String _categoryId = "0";

  @override
  void initState() {
    // TODO: implement initState
    _getListCategories();
    super.initState();
  }

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
            height: double.infinity,
            child: isLoading
                ? PageLoading()
                : Column(
                    children: [
                      Container(
                        height: 50,
                        child: CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: _categories.map((e) {
                            return e['nama'].toString();
                          }).toList(),
                          buttonValues: _categories.map((e) {
                            return e['id'].toString();
                          }).toList(),
                          defaultSelected: _categories.length > 0
                              ? _categories[0]['id'].toString()
                              : null,
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 16)),
                          radioButtonValue: (value) {
                            String id = value.toString();
                            _getListItemByCategory(id);
                          },
                          selectedColor: Theme.of(context).accentColor,
                          enableShape: true,
                          width: 200,
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
                          "Menu yang Tersedia",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
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
                      isLoadingItem
                          ? Expanded(child: PageLoading())
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: () {
                                  return refresh();
                                },
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  return SingleChildScrollView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    child: _items.length <= 0
                                        ? Container(
                                            height: 200,
                                            child: Center(
                                              child: Text(
                                                  "Maaf menu belum tersedia..."),
                                            ),
                                          )
                                        : Column(
                                            children: _items
                                                .map((e) => GenCardArtikel(
                                                      ontap: () {
                                                        Navigator.pushNamed(
                                                            context, "detail",
                                                            arguments: e['id']
                                                                .toString());
                                                      },
                                                      judul:
                                                          e['nama'].toString(),
                                                      isi: e['deskripsi']
                                                          .toString(),
                                                      harga:
                                                          "Rp ${e['harga'].toString()}",
                                                      gambar:
                                                          "$BaseHostImage${e['gambar'].toString()}",
                                                    ))
                                                .toList()),
                                  );
                                }),
                              ),
                            ),
                      // SizedBox(
                      //   height: 100,
                      // ),
                    ],
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

  void _getListCategories() async {
    setState(() {
      isLoading = true;
    });
    List<dynamic> _list = await getCategoriesList();
    setState(() {
      _categories = _list;
      isLoading = false;
    });
    if (_list.length > 0) {
      String id = _list[0]['id'].toString();
      _getListItemByCategory(id);
    }
  }

  void _getListItemByCategory(String id) async {
    setState(() {
      isLoadingItem = true;
      _categoryId = id;
    });
    List<dynamic> _list = await getItemByCategory(id);
    setState(() {
      _items = _list;
      isLoadingItem = false;
    });
  }

  refresh() async {
    _getListItemByCategory(_categoryId);
  }
}
