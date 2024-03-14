import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/data/models/surah.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(children: [
        IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: SvgPicture.asset('assets/images/back-icon.svg')),
        const SizedBox(
          width: 24,
        ),
        Text(
          surah.namaLatin,
          style: GoogleFonts.poppins(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
