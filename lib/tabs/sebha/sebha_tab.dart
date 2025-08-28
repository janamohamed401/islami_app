import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  bool showSebha = true;

  List<String> contentList = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
  ];
  List<int> repeatList = [33, 33, 33, 1];

  int index = 0;
  int counter = 0;


  String get titleChange => contentList[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/BackgroundSebha.png"),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/onBoardingHeader.png"),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: GoogleFonts.elMessiri(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Row(),
                  AnimatedOpacity(
                    opacity: showSebha ? 1.0 : 0.0,
                    duration:  const Duration(milliseconds: 700),
                    child: Image.asset(
                      "assets/images/pointer.png",
                      height: MediaQuery.of(context).size.height * .14,
                    ),
                  ),
                  Positioned.fill(
                    top: MediaQuery.of(context).size.height * .11,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(updateTasbeh);
                            },
                            child: AnimatedOpacity(
                              opacity: showSebha ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 700),
                              child: AnimatedRotation(
                                turns:  (counter / repeatList[index]),
                                  duration: const Duration(milliseconds: 500),

                                child: Image.asset(
                                  "assets/images/SebhaBody.png",
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(),
                              Text(
                                titleChange,
                                style: GoogleFonts.elMessiri(
                                  color: AppColors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                counter.toString(),
                                style: GoogleFonts.aBeeZee(
                                  color: AppColors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
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

  void updateTasbeh() {
    counter++;

    if (counter == repeatList[index]) {
      setState(() {
        showSebha = false;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          counter = 0;
          index = (index + 1) % contentList.length;
          showSebha = true;
        });
      });
    }
  }
}
