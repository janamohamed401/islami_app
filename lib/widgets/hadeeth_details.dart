import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/theme/app_colors.dart';

class HadeethDetails extends StatelessWidget {
  final String title;
  final List<String> content;
  final int index;

  const HadeethDetails({
    super.key,
    required this.title,
    required this.content,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        scrolledUnderElevation: 0,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.Gold),
        title: Text(
          "Hadith ${index + 1}",
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
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      color: AppColors.Gold,
                      fontSize: 20,
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                content.join("\n"),
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                  color: AppColors.Gold,
                  fontSize: 22,
                  height: 1.6,
                ),
              ),
            ),
          ),

          Image.asset("assets/images/img_bottom_decoration.png"),
        ],
      ),
    );
  }
}
