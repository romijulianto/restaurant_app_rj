import 'package:flutter/material.dart';
import 'package:restaurant_app_rj/page/detail_page.dart';
import 'package:restaurant_app_rj/page/list_page.dart';
import 'package:restaurant_app_rj/splashscreen/splash_screen.dart';

void main() {
  runApp(const RjApp());
}

class RjApp extends StatelessWidget {
  const RjApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        RestaurantList.routeName: (context) => const RestaurantList(),
        RestoDetail.routeName: (context) => RestoDetail(
              resto: ModalRoute.of(context)?.settings.arguments as dynamic,
            ),
      },
    );
  }
}
