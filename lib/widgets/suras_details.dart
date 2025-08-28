import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:quran/quran.dart' as quran;

class SurasDetails extends StatelessWidget {
  static const String routeName = "details";

  final int suraNumber;
  final String suraNameArabic;
  final String suraNameEnglish;

  const SurasDetails({
    super.key,
    required this.suraNumber,
    required this.suraNameArabic,
    required this.suraNameEnglish,
  });

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> pageToVerses = {};
    int verseCount = quran.getVerseCount(suraNumber);

    for (int i = 1; i <= verseCount; i++) {
      int page = quran.getPageNumber(suraNumber, i);
      pageToVerses.putIfAbsent(page, () => []).add(i);
    }

    final pages = pageToVerses.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.black,
        scrolledUnderElevation: 0,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.Gold),
        title: Text(
          suraNameEnglish,
          style: GoogleFonts.amiri(
            color: AppColors.Gold,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/img_left_corner.png",
                  height: 90,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    suraNameArabic,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.amiri(
                      color: AppColors.Gold,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  "assets/images/img_right_corner.png",
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          Expanded(
            child: PageView.builder(
              reverse: true,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final verseNumbers = pages[index].value;

                List<InlineSpan> verseSpans = verseNumbers.map((verseIndex) {
                  final verseText = quran.getVerse(suraNumber, verseIndex);

                  return TextSpan(
                    children: [
                      TextSpan(
                        text: '$verseText ',
                        style: GoogleFonts.amiri(
                          fontSize: 22,
                          color: AppColors.Gold,
                          height: 2,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            '﴾$verseIndex﴿',
                            style: GoogleFonts.amiri(
                              fontSize: 20,
                              color: AppColors.Gold,
                              height: 2,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ' '),
                    ],
                  );
                }).toList();

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (index == 0 &&
                            suraNumber != 1 &&
                            suraNumber != 9)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Center(
                              child: Text(
                                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                style: GoogleFonts.amiri(
                                  fontSize: 24,
                                  color: AppColors.Gold,
                                  height: 2.5,
                                ),
                              ),
                            ),
                          ),

                        RichText(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          text: TextSpan(children: verseSpans),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Image.asset("assets/images/img_bottom_decoration.png"),
        ],
      ),
    );
  }
}
