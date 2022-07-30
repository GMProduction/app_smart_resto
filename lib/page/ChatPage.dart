import 'dart:developer';

import 'package:aplikasi_resto/controller/chat.dart';
import 'package:aplikasi_resto/genosLib/component/etc/commonPadding.dart';
import 'package:aplikasi_resto/genosLib/component/textfiled/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/etc/headerProfile.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';

class ChatPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<ChatPage> {
//  CUMA DUMMY HAPUS NEXT
  TextEditingController txtChat = TextEditingController();

//  VARIABEL
//   final req = new GenRequest();
  var readyToHit = false;
  var chat = '';
  bool loginSend = false;
  bool chatSend = false;

  List<Map<String, dynamic>> chatMessage = [
    {
      "member": false,
      "message": "Hai, Selamat datang di layanan chat bot Sang Ndoro Coffee"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
//
    txtChat = TextEditingController();
    super.initState();
  }

  // ScrollController _scrollController = ScrollController();
  //
  // _scrollToBottom() {
  //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  // }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return GenPage(
        appbar: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: GenShadow().genShadow()),
          child: Column(
            children: [
              Row(children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Center(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.black87,
                            )))),
                Expanded(
                  child: HeaderProfile(
                      image:
                          "https://static.thenounproject.com/png/630729-200.png",
                      vAlign: CrossAxisAlignment.center,
                      photoSize: 30,
                      child: Row(
                        children: [
                          Expanded(
                            child: GenText(
                              "Chat",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                          ),
                          // Container(
                          //     width: 100.h,
                          //     height: 100.h,
                          //     child: Center(
                          //         child: InkWell(
                          //             onTap: () {
                          //               Navigator.of(context).pop();
                          //             },
                          //             child: Icon(
                          //               Icons.phone,
                          //               color: Colors.black87,
                          //             )))),
                        ],
                      )),
                )
              ])
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: CommonPadding(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: chatMessage.map<Widget>((msg) {
                          bool isSend = msg["member"];
                          return Align(
                            alignment: isSend
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: isSend
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                            topLeft: !isSend
                                                ? Radius.circular(0)
                                                : Radius.circular(15),
                                            topRight: !isSend
                                                ? Radius.circular(15)
                                                : Radius.circular(0)),
                                        color: isSend
                                            ? GenColor.primaryColor
                                            : GenColor.shadowLigth),
                                    padding:
                                        EdgeInsets.all(GenDimen.sidePadding),
                                    child: GenText(
                                      msg["message"],
                                      style: TextStyle(
                                          color: !isSend
                                              ? Colors.black
                                              : Colors.white),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )),
                  ]),
                ),
              ),
              CommonPadding(
                padding: EdgeInsets.all(GenDimen.sidePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextLoginField(
                      controller: txtChat,
                      // borderColor: Colors.black12,
                      // sufixIcon: IconButton(
                      //   padding: EdgeInsets.all(0),
                      //   alignment: Alignment.centerRight,
                      //   icon: Icon(Icons.send) ,
                      //   onPressed: () {
                      //     setState(() {});
                      //   },
                      // ),
                      radius: 10,
                      label: "Tulis Pesan",
                      onSaved: (asw) {},
                      onChanged: (val) {
                        chat = val;

                        if (val == '') {
                          chatSend == false;
                        } else {
                          chatSend = true;
                        }
                      },
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: InkWell(
                        onTap: () {
                          if (chat != '') {
                            _sendChat();
                            txtChat.text = '';
                            chat = '';

                            loginSend = true;
                          }
                        },
                        child: GenText(
                          "Kirim",
                          style: TextStyle(
                              fontSize: 25,
                              color: GenColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _sendChat() async {
    Map<String, dynamic> _data = {"quest": chat};
    setState(() {
      chatMessage.add({"member": true, "message": chat});
    });

    String answer = await sendChat(_data);
    setState(() {
      chatMessage.add({"member": false, "message": answer});
    });

    log(answer);
  }
//  api/member/chat post: msg: ts: id

// void sendMessage(msg) async {
//   setState(() {
//     readyToHit = false;
//   });
//
//   dynamic data;
//   data = await req.postApi(
//       "member/chat", {"msg": msg, "tsId": transaksiBloc.getDataChat('tsId')});
//   setState(() {
//     readyToHit = true;
//   });
//
//   loginSend = false;
//
//   if (data["code"] == 200) {
//     setState(() {});
//     _scrollToBottom();
//   } else {
//     setState(() {
//       toastShow("Terjadi kesalahan coba cek koneksi internet kamu", context,
//           GenColor.red);
//     });
//   }
// }
}
