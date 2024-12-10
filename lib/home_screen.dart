import 'dart:collection';

import 'package:alquran/Tabs/adhan.dart';
import 'package:alquran/Tabs/hadeth.dart';
import 'package:alquran/Tabs/quran.dart';
import 'package:alquran/Tabs/sabha.dart';
import 'package:alquran/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/minBack.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "قرأنى",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectIndex,
              onTap: (index) {
                selectIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/sebha_blue.png"),
                      size: 50,
                    ),
                    label: "المسبحة"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/Group.png"),
                      size: 50,
                    ),
                    label: " الأذان"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/Group 6.png"),
                      size: 50,
                    ),
                    label: "الأذكار"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/moshaf_gold.png"),
                      size: 50,
                    ),
                    label: " القرآن"),
              ]),
          body: tabs[selectIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    Sabha(),
    Adhan(),
    Hadeth(),
    SurahTab(),
  ];
}
