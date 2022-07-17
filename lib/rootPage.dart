import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'genosLib/bloc/baseBloc.dart';
import 'routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final navigatorKey = GlobalKey<NavigatorState>();

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // FlutterLocalNotificationsPlugin localNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

//  InboxBloc iBloc;
//   unNavigateNotification(dynamic message) async {
// //    if (iBloc != null && iBloc.getRoomActive() == message['data']['idDoc']) {
// //      AudioCache cache = new AudioCache();
// //      await cache.play("done-for-you.mp3");
// //    } else {
//     showNotificationWithSound(message);
//   }

  // Future showNotificationWithSound(dynamic message) async {
  //   var scheduledNotificationDateTime =
  //       DateTime.now().add(Duration(seconds: 30));
  //   var vibrationPattern = Int64List(4);
  //   vibrationPattern[0] = 0;
  //   vibrationPattern[1] = 1000;
  //   vibrationPattern[2] = 5000;
  //   vibrationPattern[3] = 2000;
  //
  //   AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'your channel id', 'your channel name',
  //           // sound: AndroidNotificationSound.
  //           // sound: AndroidNotificationSo
  //           // RawResourceAndroidNotificationSound("loving_you"),
  //           importance: Importance.high,
  //           vibrationPattern: vibrationPattern,
  //           priority: Priority.high);
  //
  //   IOSNotificationDetails iOSPlatformChannelSpecifics =
  //       IOSNotificationDetails(sound: "slow_spring_board.aiff");
  //   NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);
  //
  //   await localNotificationsPlugin.show(0, message['notification']['title'],
  //       message['notification']['body'], platformChannelSpecifics,
  //       payload: json.encode(message));
  //
  //   getMessage(message);
  // }
//
//   Future navigate(payload) async {
//     dynamic msgData = payload['data'];
// //    if (msgData['type'] == "inbox") {
// //      await bloc.profil.readCreds();
// //      navigatorKey.currentState.pushNamed(ChatRoomState.routeName,
// //          arguments: ChatRoom(
// //            idDocument: msgData['pid'],
// //            productName: msgData['pName'],
// //          ));
// //    }
// //    if (msgData['type'] == 'Konfirmasi') {
// //      navigatorKey.currentState.pushNamed(DetailTransaksiState.routeName,
// //          arguments: DetailTransaksi(
// //              idTransaksi: int.parse(msgData["id"]),
// //              notification: msgData['msg']));
// //    }
//   }

  @override
  void initState() {
    var initSettingAndroid = AndroidInitializationSettings('ic_launcher');
    var initSettingIOS = IOSInitializationSettings();


    super.initState();
//    Pembayaran_diterima
//    Pembayaran_ditolak
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         unNavigateNotification(message);
//       },
//       onLaunch: (Map<String, dynamic> message) async {
// //          setPrefferenceBool('noNavigate', true);
//         navigate(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         getMessage(message);
// //          navigate(message);
//       },
//     );

    // FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
    //   RemoteNotification notification = message!.notification!;
    //   AndroidNotification android = message!.notification!.android!;
    //   unNavigateNotification(message);
    //   getMessage(message);
    //   print("pesan $message");
    // });
    //
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   Navigator.pushNamed(context, '/');
    // });
  }

  BaseBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: Color(0xFFF5F5F5))),
        theme: ThemeData(fontFamily: 'Nunito', appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),),
        initialRoute: 'splashScreen',
        routes: GenProvider.routes(context),
        debugShowCheckedModeBanner: false,
      ),
      providers: GenProvider.providers,
      builder: (context, widget) {
        bloc = Provider.of<BaseBloc>(context);
        return widget!;
      },
    );
  }

  Future onSelectNotification(String pld) async {
    Map<dynamic, dynamic> payload = json.decode(pld);
    dynamic msgData = payload['data'];
//
//    if (msgData['type'] == "inbox") {
//      navigatorKey.currentState.pushNamed(ChatRoomState.routeName,
//          arguments: ChatRoom(
//            idDocument: msgData['pid'],
//            productName: msgData['pName'],
//          ));
//    }

//    if (msgData['type'] == 'Pesanan') {
//    GenCustomAlert(
//        navigatorKey.currentState.overlay.context, msgData['data']['body'],
////        img: 'assets/images/icons/logotok.png',
//        isi: msgData['data']['msg'],
//        height: 300.h,
//        body: Container(
//            margin: EdgeInsets.only(bottom: 20.h),
//            width: 300.w,
//            child: GenButton(
//              text: "Lihat",
//              iconRight: Icons.chevron_right,
//              ontap: () {
//                navigatorKey.currentState.pop();
//                msgData["data"]["type"] == "Pesanan"
//                    ? navigatorKey.currentState.pushNamed("tagihan")
//                    : msgData["data"]["type"] == "Konfirmasi"
//                        ? navigatorKey.currentState.pushNamed('vcall',
//                            arguments: CallScreen(
//                                peerId: msgData["data"]["clientId"]
//                            ))
//                        : navigatorKey.currentState.pop(context);
//              },
//            )));
  }

//  }

//   Future getMessage(message) async {
//     print("pesan $message");
//     sendAnalyticsEvent(s_BellNotification);
//     var isChat = message["data"]["type"] == "chat";
//     var isOffline = message["data"]["type"] == "Konfirmasi" &&
//         message["data"]["method"] == "1";
//     if (message["data"]["type"] == "Konfirmasi" &&
//         message["data"]["method"] == "2") {
//       await setPrefferenceIdClient(message["data"]["clientId"]);
//     }
//
//     if (!isChat || isOffline) {
//       GenCustomAlert(
//           navigatorKey.currentState.overlay.context, message['data']['body'],
// //        img: 'assets/images/icons/logotok.png',
//           isi: message['data']['msg'],
//           height: 300.h,
//           body: Container(
//               margin: EdgeInsets.only(bottom: 20.h),
//               width: 300.w,
//               child: GenButton(
//                 text:
//                     message["data"]["type"] == "Konfirmasi" ? "Mulai" : "Lihat",
//                 iconRight: Icons.chevron_right,
//                 ontap: () {
//                   navigatorKey.currentState.pop();
//                   message["data"]["type"] == "Pesanan" ||
//                           message["data"]["type"] == "Pembayaran_les_ditolak "
//                       ? navigatorKey.currentState.pushNamed("keranjang")
//                       : message["data"]["type"] == "Konfirmasi" &&
//                               message["data"]["method"] == "2"
//                           ? navigatorKey.currentState.pushNamed('jitsi',
//                               arguments: JitsiCall(
//                                   roomName: message["data"]["clientId"]))
//                           : message["data"]["type"] == "Konfirmasi" &&
//                                   message["data"]["method"] == "1"
//                               ? navigatorKey.currentState.pushNamed('base')
//                               : message["data"]["type"] ==
//                                       "Pembayaran_les_diterima "
//                                   ? navigatorKey.currentState
//                                       .pushNamed("riwayatBerlangganan")
//                                   : message["data"]["type"] ==
//                                           "Pembayaran_tryout_diterima"
//                                       ? navigatorKey.currentState
//                                           .pushNamed("historyTryout")
//                                       : navigatorKey.currentState
//                                           .pushNamed('base');
//                 },
//               )));
//     }
//   }
}
