import 'package:flutter/material.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/onBoarding/on_boarding_screen.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';
import 'package:islami_app/widgets/suras_details.dart';

class SurasDetailsArgs {
  final String suraNameArabic;
  final String suraNameEnglish;
  final int suraNumber;

  SurasDetailsArgs({
    required this.suraNameArabic,
    required this.suraNameEnglish,
    required this.suraNumber,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        SurasDetails.routeName: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as SurasDetailsArgs;
          return SurasDetails(
            suraNumber: args.suraNumber,
            suraNameArabic: args.suraNameArabic,
            suraNameEnglish: args.suraNameEnglish,
          );
        },
      },
      initialRoute: CacheHelper.getEligibility() == true
          ? HomeScreen.routeName
          : OnBoardingScreen.routeName,
    );
  }
}
