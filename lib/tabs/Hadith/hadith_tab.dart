import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../core/theme/app_colors.dart';
import '../../models/hadeeth_model.dart';
import '../../widgets/hadeeth_details.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadeethModel> allAhadeeth = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  loadHadethFile() async {
    String file = await rootBundle.loadString("assets/files/ahadeeth.txt");
    List<String> ahadeeth = file.split("#");

    for (String data in ahadeeth) {
      List<String> lines = data.trim().split("\n");
      if (lines.isEmpty) continue;

      String title = lines[0];
      lines.removeAt(0);
      List<String> content = lines;

      HadeethModel hadeethModel = HadeethModel(content: content, title: title);
      allAhadeeth.add(hadeethModel);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(child: Image.asset("assets/images/onBoardingHeader.png")),
          Expanded(
            child: allAhadeeth.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : CarouselSlider.builder(
                    itemCount: allAhadeeth.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: double.infinity,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: AppColors.Gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: BuildBodyHadith(
                          hadithIndex: index,
                          allAhadeeth: allAhadeeth,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class BuildBodyHadith extends StatelessWidget {
  final int hadithIndex;
  final List<HadeethModel> allAhadeeth;

  const BuildBodyHadith({
    super.key,
    required this.hadithIndex,
    required this.allAhadeeth,
  });

  @override
  Widget build(BuildContext context) {
    final hadith = allAhadeeth[hadithIndex];

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HadeethDetails(
            title: hadith.title,
            content: hadith.content,
            index: hadithIndex,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/left_corner.png", width: 70),
                const SizedBox(width: 8),
                Expanded(
                  child: AutoSizeText(
                    hadith.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.elMessiri(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  "assets/images/right_corner.png",
                  width: 70,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadith.content.join("\n"),
                textAlign: TextAlign.center,
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
