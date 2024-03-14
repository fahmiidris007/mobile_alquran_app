import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';

class BuildTab extends StatelessWidget {
  const BuildTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        unselectedLabelColor: AppColors.text,
        labelColor: Colors.white,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Surah"),
          _tabItem(label: "Bookmark"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
