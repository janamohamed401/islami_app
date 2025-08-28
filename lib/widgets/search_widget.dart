import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;

  const SearchWidget({
    super.key,
    required this.searchController,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return   TextField(
      controller: searchController,
      cursorColor: AppColors.Gold,
      style: GoogleFonts.elMessiri(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      cursorWidth: 2,
      cursorHeight: 16,
      decoration: InputDecoration(
        hintText: "Sura Name",
        hintStyle: GoogleFonts.elMessiri(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: const ImageIcon(
          AssetImage("assets/images/Quran.png"),
          color: AppColors.Gold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.Gold),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.Gold),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.Gold),
        ),
      ),
    );
  }
}
