import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

class SurasHorizontal extends StatelessWidget {
  final String nameArabic;
  final String nameEnglish;
  final String AyaNumber;

  const SurasHorizontal({
    super.key,
    required this.nameArabic,
    required this.nameEnglish,
    required this.AyaNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameEnglish,
                  style: GoogleFonts.amiri(
                    color: AppColors.Black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  nameArabic,
                  style: GoogleFonts.amiri(
                    color: AppColors.Black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$AyaNumber Verses",
                  style: GoogleFonts.amiri(
                    color: AppColors.Black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 120,
          height: 100,
          child: Image.asset(
            "assets/images/horizontal.png",
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
