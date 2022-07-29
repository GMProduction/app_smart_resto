import 'package:aplikasi_resto/page/ChatPage.dart';
import 'package:aplikasi_resto/page/DetailPesanan.dart';
import 'package:aplikasi_resto/page/PesananPage.dart';
import 'package:aplikasi_resto/page/detailPage.dart';
import 'package:aplikasi_resto/page/homePage.dart';
import 'package:aplikasi_resto/page/keranjangPage.dart';
import 'package:aplikasi_resto/page/login.dart';
import 'package:aplikasi_resto/page/register.dart';
import 'package:aplikasi_resto/page/splashScreen.dart';
import 'package:aplikasi_resto/page/welcomePage.dart';
import 'package:provider/provider.dart';

import 'genosLib/bloc/baseBloc.dart';

class GenProvider {
  static var providers = [
    ChangeNotifierProvider<BaseBloc>.value(value: BaseBloc()),
  ];

  static routes(context) {
    return {
//           '/': (context) {
//        return Base();
//      },

      '/': (context) {
        return SplashScreen();
      },

      'welcome': (context) {
        return WelcomePage();
      },

      'login': (context) {
        return LoginPage();
      },
      'register': (context) {
        return RegisterPage();
      },

      'home': (context) {
        return HomePage();
      },

      'detail': (context) {
        return DetailPage();
      },

      'keranjang': (context) {
        return KeranjangPage();
      },
      'pesanan': (context) {
        return PesananPage();
      },
      'detail-pesanan': (context) {
        return DetailPesananPage();
      },

      'chat': (context) {
        return ChatPage();
      },
    };
  }
}
