import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/tabs/Time/time_tab.dart';

import '../../tabs/Hadith/hadith_tab.dart';
import '../../tabs/Quran/quran_tab.dart';
import '../../tabs/Radio/radio_tab.dart';
import '../../tabs/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<String> backgrounds = [
    "assets/images/BackgroundQuran.png",
    "assets/images/BackgroundHadith.png",
    "assets/images/BackgroundSebha.png",
    "assets/images/BackgroundRadio.png",
    "assets/images/BackgroundTime.png",
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaScreen(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgrounds[currentIndex]),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: tabs[currentIndex],
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.Black,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.shifting,
          backgroundColor: AppColors.Gold,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.Gold,
              icon: NavIcon(
                imageName: "Quran",
                index: 0,
                currentIndex: currentIndex,
              ),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.Gold,
              icon: NavIcon(
                imageName: "ic_hadeth",
                index: 1,
                currentIndex: currentIndex,
              ),
              label: "Hadith",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.Gold,
              icon: NavIcon(
                imageName: "ic_sebha",
                index: 2,
                currentIndex: currentIndex,
              ),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.Gold,
              icon: NavIcon(
                imageName: "ic_radio",
                index: 3,
                currentIndex: currentIndex,
              ),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.Gold,
              icon: NavIcon(
                imageName: "ic_time",
                index: 4,
                currentIndex: currentIndex,
              ),
              label: "Time",
            ),
          ],
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  final String imageName;
  final int index;
  final int currentIndex;

  const NavIcon({
    super.key,
    required this.imageName,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == currentIndex;

    if (isSelected) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0x8C202020),
          borderRadius: BorderRadius.circular(66),
        ),
        child: ImageIcon(AssetImage("assets/images/$imageName.png")),
      );
    } else {
      return ImageIcon(AssetImage("assets/images/$imageName.png"));
    }
  }
}
