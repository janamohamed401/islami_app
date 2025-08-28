import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cache/cache_helper.dart';
import '../../widgets/header_widget.dart';
import '../home/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoardingScreen";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': "Welcome To Islami App",
      'body': "",
      'image': "assets/images/onBoarding1.png"
    },
    {
      'title': "Welcome To Islami",
      'body': "We Are Very Excited To Have You In Our Community",
      'image': "assets/images/onBoarding2.png"
    },
    {
      'title': "Reading the Quran",
      'body': "Read, and your Lord is the Most Generous",
      'image': "assets/images/onBoarding3.png"
    },
    {
      'title': "Bearish",
      'body': "Praise the name of your Lord, the Most High",
      'image': "assets/images/onBoarding4.png"
    },
    {
      'title': "Holy Quran Radio",
      'body':
      "You can listen to the Holy Quran Radio through the application for free and easily",
      'image': "assets/images/onBoarding5.png"
    },
  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Black,
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            page['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          page['title']!,
                          style: GoogleFonts.elMessiri(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Gold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        if (page['body']!.isNotEmpty)
                          Text(
                            page['body']!,
                            style: GoogleFonts.elMessiri(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.Gold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: _currentIndex == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.Gold
                        : AppColors.Gray,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex > 0
                      ? TextButton(
                    onPressed: _prevPage,
                    child: Text(
                      "Back",
                      style: GoogleFonts.elMessiri(
                        color: AppColors.Gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                      : const SizedBox(),
                  TextButton(
                    onPressed: () {
                      if(_currentIndex==_pages.length-1)
                        {
                          CacheHelper.saveEligibility();
                          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

                        }
                      else
                        {
                          _nextPage();
                        }
                    },
                    child: Text(
                      _currentIndex == _pages.length - 1 ? "Finish" : "Next",
                      style:  GoogleFonts.elMessiri(
                        color: AppColors.Gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
