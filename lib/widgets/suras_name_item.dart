import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/theme/app_colors.dart';

class SurasNameItem extends StatelessWidget {
  String nameArabic;
  String nameEnglish;
  String AyaNumber;
  int index;

  SurasNameItem({
    super.key,
    required this.index,
    required this.nameArabic,
    required this.nameEnglish,
    required this.AyaNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/star.png', width: 50, height: 50),
                Text(
                  '$index',
                  style: GoogleFonts.cairo(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameEnglish,
                  style: GoogleFonts.amiri(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "$AyaNumber Verses",
                  style: GoogleFonts.amiri(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              nameArabic,
              style: GoogleFonts.amiri(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
