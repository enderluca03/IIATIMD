import 'package:coochie_clicker/pages/navpages/shop_page.dart';
import 'package:coochie_clicker/pages/navpages/home_page.dart';
import 'package:coochie_clicker/library/globals.dart' as globals;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List pages = [
    const HomePage(),
    ShopPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (globals.timPunten > 0) {
      globals.autoIncrement();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(

      backgroundColor: Colors.blue,
      body: pages[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white70,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(label:"Home", icon: Icon(Icons.cookie)),
          BottomNavigationBarItem(label:"Shop", icon: Icon(Icons.money)),
        ],
      ) ,
    );
  }
}
